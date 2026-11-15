#!/usr/bin/env python3
"""Extend the TOEIC seed SQL using ECDICT and an open English-Vietnamese dictionary."""

from __future__ import annotations

import argparse
import csv
import json
import os
import re
import sys
import time
from html.parser import HTMLParser
from pathlib import Path
from urllib.error import HTTPError, URLError
from urllib.parse import quote
from urllib.request import Request, urlopen


ROOT = Path(__file__).resolve().parents[1]
SQL_FILE = ROOT / "src" / "main" / "resources" / "vocab_data.sql"
ECDICT_URL = "https://raw.githubusercontent.com/skywind3000/ECDICT/master/ecdict.csv"
FREE_DICTIONARY_URL = "https://api.dictionaryapi.dev/api/v2/entries/en/{}"
VIETNAMESE_DICTIONARY_URL = (
    "https://raw.githubusercontent.com/samuraitruong/open-vn-en-dict/master/data/{}.json"
)
USER_AGENT = "N11-TOEIC-vocabulary-generator/1.0"
WORD_RE = re.compile(r"[a-z][a-z'-]{1,38}\Z", re.IGNORECASE)
TOKEN_RE = re.compile(r"[a-z]+")

TOPIC_KEYWORDS = {
    "Business & Office": {
        "business", "office", "company", "corporate", "employee", "employer",
        "meeting", "manager", "management", "staff", "colleague", "department",
        "supervisor", "executive", "director", "secretary", "document", "report",
        "schedule", "conference", "memo", "correspondence", "workplace",
        "administration", "organization", "agenda", "appointment", "payroll",
        "board", "branch", "headquarters", "personnel", "seminar", "work",
    },
    "Travel & Transport": {
        "travel", "transport", "airport", "airline", "flight", "plane", "train",
        "railway", "station", "ticket", "passenger", "luggage", "baggage", "hotel",
        "accommodation", "reservation", "itinerary", "departure", "arrival",
        "destination", "journey", "trip", "tour", "tourist", "shuttle", "vehicle",
        "road", "traffic", "delay", "route", "fare", "boarding", "cruise", "rental",
        "terminal", "passport", "visa", "commute", "transit", "vacation",
    },
    "Shopping & Sales": {
        "shopping", "shop", "store", "retail", "purchase", "sell", "sale", "seller",
        "customer", "consumer", "price", "payment", "pay", "refund", "discount",
        "merchandise", "inventory", "receipt", "invoice", "warranty", "product",
        "catalog", "checkout", "cashier", "delivery", "order", "buyer", "exchange",
        "return", "promotion", "bargain", "vendor", "wholesale", "retailer",
    },
    "Jobs & Recruitment": {
        "job", "career", "employment", "employ", "recruit", "recruitment", "hire",
        "hiring", "applicant", "candidate", "resume", "interview", "vacancy",
        "occupation", "profession", "employee", "employer", "salary", "wage",
        "benefit", "qualification", "experience", "promotion", "retire", "retirement",
        "staff", "personnel", "workforce", "colleague", "supervisor", "position",
        "workplace", "training", "reference", "application", "resignation",
        "overtime", "worker", "workload", "skill", "expertise", "staffing",
        "recruiter", "interviewer", "jobless", "unemployment", "portfolio",
        "certificate", "labor", "appraisal", "performance", "human",
    },
    "Finance & Banking": {
        "finance", "financial", "bank", "banking", "money", "account", "accounting",
        "budget", "tax", "loan", "credit", "debit", "deposit", "withdraw", "cash",
        "currency", "fund", "investment", "invest", "interest", "profit", "loss",
        "revenue", "expense", "payment", "transaction", "balance", "statement",
        "mortgage", "insurance", "capital", "stock", "bond", "audit", "bill",
        "invoice", "asset", "liability", "fee",
    },
    "Marketing": {
        "marketing", "market", "advertise", "advertising", "advertisement",
        "promotion", "campaign", "brand", "consumer", "customer", "publicity",
        "media", "survey", "research", "product", "launch", "sales", "sponsor",
        "sponsorship", "audience", "commercial", "target", "demand", "distribution",
        "public", "marketplace", "outlet", "strategy", "feedback", "subscribe",
        "subscription", "review", "trademark", "competitive",
    },
    "Manufacturing": {
        "manufacture", "manufacturing", "factory", "production", "produce", "machine",
        "machinery", "product", "assembly", "assemble", "equipment", "industrial",
        "industry", "plant", "facility", "quality", "inspection", "inspect",
        "shipment", "supply", "supplier", "material", "component", "process",
        "operation", "operator", "warehouse", "capacity", "maintenance", "repair",
        "defect", "safety", "packaging", "package", "inventory", "output",
    },
    "Contracts": {
        "contract", "agreement", "legal", "law", "clause", "term", "condition",
        "provision", "obligation", "party", "signature", "sign", "document",
        "authorize", "authorization", "amend", "amendment", "renew", "renewal",
        "expire", "expiration", "valid", "validity", "license", "policy",
        "regulation", "consent", "settlement", "dispute", "claim", "liability",
        "confidential", "confidentiality", "warranty", "guarantee", "binding",
    },
    "Technology": {
        "technology", "computer", "software", "hardware", "device", "digital",
        "system", "network", "data", "database", "internet", "online", "website",
        "email", "electronic", "application", "program", "programmer", "server",
        "security", "install", "installation", "update", "upgrade", "technical",
        "support", "access", "file", "computerized", "document", "information",
        "communication", "mobile", "signal", "wireless", "password", "screen",
    },
    "Health": {
        "health", "medical", "medicine", "clinic", "hospital", "doctor", "patient",
        "insurance", "treatment", "treat", "illness", "disease", "injury", "care",
        "nurse", "physician", "prescription", "pharmacy", "dental", "healthcare",
        "wellness", "emergency", "appointment", "checkup", "examination", "therapy",
        "symptom", "recovery", "surgery", "benefit", "claim", "coverage", "policy",
    },
}
TOPIC_VI_HINTS = {
    "Business & Office": ("thư ký", "giám đốc", "tổ chức", "công ty", "doanh nghiệp", "nhân viên", "văn phòng", "cuộc họp"),
    "Travel & Transport": ("hành khách", "sân bay", "vé", "chuyến bay", "chuyến đi", "du lịch", "đường"),
    "Shopping & Sales": ("cửa hàng", "khách hàng", "hàng hóa", "giá", "mua", "bán"),
    "Jobs & Recruitment": ("nghỉ hưu", "ứng viên", "tuyển dụng", "việc làm", "nhân viên", "nghề", "công việc"),
    "Finance & Banking": ("tín dụng", "cổ phiếu", "ngân hàng", "tài chính", "tài khoản", "lãi", "tiền", "thuế"),
    "Marketing": ("mục tiêu", "thương hiệu", "tiếp thị", "quảng cáo", "thị trường", "khách hàng", "nhãn hiệu"),
    "Manufacturing": ("quy trình", "chế tạo", "nhà máy", "sản xuất", "hàng hóa"),
    "Contracts": ("điều khoản", "hợp đồng", "thỏa thuận", "luật", "nghĩa vụ", "pháp lý"),
    "Technology": ("máy chủ", "chương trình", "phần mềm", "máy tính", "mạng", "truyền thông", "công nghệ", "hệ thống"),
    "Health": ("y tá", "bác sĩ", "bệnh viện", "phẫu thuật", "điều trị", "y tế", "sức khỏe"),
}
WORD_VI_OVERRIDES = {
    ("Technology", "server"): "máy chủ",
    ("Contracts", "license"): "giấy phép",
    ("Technology", "program"): "chương trình",
    ("Business & Office", "organization"): "tổ chức",
    ("Business & Office", "executive"): "giám đốc",
    ("Shopping & Sales", "shop"): "cửa hàng",
    ("Finance & Banking", "credit"): "tín dụng",
    ("Finance & Banking", "stock"): "cổ phiếu",
    ("Health", "nurse"): "y tá",
    ("Health", "doctor"): "bác sĩ",
    ("Health", "medical"): "y tế",
    ("Health", "surgery"): "phẫu thuật",
}
EXAMPLE_TEMPLATES = {
    "Business & Office": (
        ("The manager provided information about the {word}.", "Quản lý đã cung cấp thông tin về {meaning}."),
        ("The staff will {word} the documents before the meeting.", "Nhân viên sẽ {meaning} các tài liệu trước cuộc họp."),
        ("The {word} document was sent to all staff.", "Tài liệu {meaning} đã được gửi cho toàn bộ nhân viên."),
    ),
    "Travel & Transport": (
        ("The travel agent provided information about the {word}.", "Đại lý du lịch đã cung cấp thông tin về {meaning}."),
        ("Passengers should {word} at the airport.", "Hành khách nên {meaning} tại sân bay."),
        ("The {word} service is available at the airport.", "Dịch vụ {meaning} có tại sân bay."),
    ),
    "Shopping & Sales": (
        ("The sales associate explained the {word} to the customer.", "Nhân viên bán hàng đã giải thích về {meaning} cho khách hàng."),
        ("Customers can {word} this item online.", "Khách hàng có thể {meaning} mặt hàng này trực tuyến."),
        ("The {word} product is available online.", "Sản phẩm {meaning} này có bán trực tuyến."),
    ),
    "Jobs & Recruitment": (
        ("The recruiter asked for more information about the {word}.", "Nhà tuyển dụng đã yêu cầu thêm thông tin về {meaning}."),
        ("The company plans to {word} more staff this year.", "Công ty dự định {meaning} thêm nhân viên trong năm nay."),
        ("The {word} candidate meets the job requirements.", "Ứng viên {meaning} đáp ứng yêu cầu công việc."),
    ),
    "Finance & Banking": (
        ("The accountant provided information about the {word}.", "Kế toán viên đã cung cấp thông tin về {meaning}."),
        ("The finance team will {word} the transaction.", "Nhóm tài chính sẽ {meaning} giao dịch này."),
        ("The bank approved the {word} application.", "Ngân hàng đã phê duyệt đơn đăng ký {meaning}."),
    ),
    "Marketing": (
        ("The company reviewed its {word} strategy.", "Công ty đã xem xét chiến lược {meaning} của mình."),
        ("The company will {word} its new product next month.", "Công ty sẽ {meaning} sản phẩm mới vào tháng tới."),
        ("The company announced a {word} campaign.", "Công ty đã công bố chiến dịch {meaning}."),
    ),
    "Manufacturing": (
        ("The supervisor provided information about the {word} to the production team.", "Giám sát viên đã cung cấp thông tin về {meaning} cho nhóm sản xuất."),
        ("The factory will {word} the parts before assembly.", "Nhà máy sẽ {meaning} các bộ phận trước khi lắp ráp."),
        ("The plant installed a new {word} system.", "Nhà máy đã lắp đặt một hệ thống {meaning} mới."),
    ),
    "Contracts": (
        ("The lawyer explained the {word} to both parties.", "Luật sư đã giải thích về {meaning} cho cả hai bên."),
        ("Both parties agreed to {word} the contract next month.", "Hai bên đồng ý {meaning} hợp đồng vào tháng tới."),
        ("The clause is {word} under the agreement.", "Điều khoản này {meaning} theo thỏa thuận."),
    ),
    "Technology": (
        ("The technician explained the {word} to the staff.", "Kỹ thuật viên đã giải thích về {meaning} cho nhân viên."),
        ("The technician will {word} the system after office hours.", "Kỹ thuật viên sẽ {meaning} hệ thống sau giờ làm việc."),
        ("The company installed a {word} system.", "Công ty đã cài đặt một hệ thống {meaning}."),
    ),
    "Health": (
        ("The {word} is important to the patient's care.", "{meaning} đóng vai trò quan trọng trong việc chăm sóc bệnh nhân."),
        ("The nurse will {word} the patient before the appointment.", "Y tá sẽ {meaning} cho bệnh nhân trước cuộc hẹn."),
        ("The clinic provides {word} care to employees.", "Phòng khám cung cấp dịch vụ chăm sóc {meaning} cho nhân viên."),
    ),
}

PARTS_OF_SPEECH = {
    "n": "n",
    "v": "v",
    "vi": "v",
    "vt": "v",
    "a": "adj",
    "adj": "adj",
    "ad": "adv",
    "adv": "adv",
    "prep": "prep",
    "pron": "pron",
    "conj": "conj",
    "int": "interj",
    "interj": "interj",
}
DEFINITION_POS_RE = re.compile(
    r"^\s*(n|v|vi|vt|a|adj|ad|adv|prep|pron|conj|int|interj)\.\s*",
    re.IGNORECASE,
)


class VietnameseGlossParser(HTMLParser):
    def __init__(self) -> None:
        super().__init__(convert_charrefs=True)
        self.in_meaning_row = False
        self.in_meaning_cell = False
        self.current_text: list[str] = []
        self.meanings: list[str] = []

    def handle_starttag(self, tag: str, attrs: list[tuple[str, str | None]]) -> None:
        attributes = dict(attrs)
        if tag == "tr":
            self.in_meaning_row = attributes.get("id") == "mn"
        elif (
            self.in_meaning_row
            and tag == "td"
            and attributes.get("id") == "C_C"
        ):
            self.in_meaning_cell = True
            self.current_text = []

    def handle_data(self, data: str) -> None:
        if self.in_meaning_cell:
            self.current_text.append(data)

    def handle_endtag(self, tag: str) -> None:
        if tag == "td" and self.in_meaning_cell:
            meaning = re.sub(r"\s+", " ", " ".join(self.current_text)).strip()
            meaning = re.sub(r"^(?:\([^)]*\)\s*)+", "", meaning).strip(" ;")
            if meaning:
                self.meanings.append(meaning)
            self.in_meaning_cell = False
        elif tag == "tr":
            self.in_meaning_row = False


def request_bytes(url: str, timeout: int = 30) -> bytes:
    for attempt in range(5):
        request = Request(url, headers={"User-Agent": USER_AGENT})
        try:
            with urlopen(request, timeout=timeout) as response:
                return response.read()
        except HTTPError as error:
            if error.code == 404 or error.code not in (408, 425, 429, 500, 502, 503, 504):
                raise
            if attempt == 4:
                raise
            retry_after = error.headers.get("Retry-After")
            delay = int(retry_after) if retry_after and retry_after.isdigit() else 2**attempt
        except (URLError, TimeoutError):
            if attempt == 4:
                raise
            delay = 2**attempt
        time.sleep(min(delay, 30))
    raise RuntimeError(f"Request failed after retries: {url}")


def parse_ecdict_definition(raw_definition: str, raw_pos: str) -> tuple[str, str]:
    definitions = []
    detected_pos = raw_pos
    for line in raw_definition.replace("\\n", "\n").splitlines():
        line = re.sub(r"<[^>]*>", " ", line).strip()
        if not line:
            continue
        match = DEFINITION_POS_RE.match(line)
        if match:
            if not detected_pos:
                detected_pos = match.group(1).casefold()
            line = line[match.end():].strip()
        if line:
            definitions.append(line)
        if len(definitions) == 2:
            break
    return re.sub(r"\s+", " ", " ".join(definitions)).strip(), detected_pos


def download_source(cache_dir: Path) -> Path:
    cache_dir.mkdir(parents=True, exist_ok=True)
    source_path = cache_dir / "ecdict.csv"
    if source_path.is_file() and source_path.stat().st_size > 0:
        return source_path

    print("Downloading the MIT-licensed ECDICT word list (about 66 MB)...")
    try:
        request = Request(ECDICT_URL, headers={"User-Agent": USER_AGENT})
        with urlopen(request, timeout=120) as response, source_path.open("wb") as target:
            while True:
                chunk = response.read(1024 * 1024)
                if not chunk:
                    break
                target.write(chunk)
    except (HTTPError, URLError, TimeoutError, OSError):
        source_path.unlink(missing_ok=True)
        raise

    if source_path.stat().st_size < 1_000_000:
        source_path.unlink(missing_ok=True)
        raise RuntimeError("The ECDICT download was unexpectedly small.")
    return source_path


def words_in_seed(sql_text: str) -> dict[str, set[str]]:
    found: dict[str, set[str]] = {}
    pattern = re.compile(
        r"JOIN\s*\((.*?)\)\s*s\s+ON\s+t\.title\s*=\s*'((?:''|[^'])*)'",
        re.IGNORECASE | re.DOTALL,
    )
    word_pattern = re.compile(
        r"(?:^|UNION\s+ALL)\s*SELECT\s+'((?:''|[^'])*)'",
        re.IGNORECASE,
    )
    for match in pattern.finditer(sql_text):
        title = match.group(2).replace("''", "'")
        words = {
            item.replace("''", "'").casefold()
            for item in word_pattern.findall(match.group(1))
        }
        found[title] = words
    generated_pattern = re.compile(
        r"INSERT\s+IGNORE\s+INTO\s+vocab_words.*?"
        r"SELECT\s+t\.id,\s*'((?:''|[^'])*)'.*?"
        r"FROM\s+vocab_topics\s+t\s+WHERE\s+t\.title\s*=\s*'((?:''|[^'])*)'\s*;",
        re.IGNORECASE | re.DOTALL,
    )
    for match in generated_pattern.finditer(sql_text):
        title = match.group(2).replace("''", "'")
        found.setdefault(title, set()).add(match.group(1).replace("''", "'").casefold())
    missing = set(TOPIC_KEYWORDS) - set(found)
    if missing:
        raise RuntimeError(
            "Could not find these topics in vocab_data.sql: " + ", ".join(sorted(missing))
        )
    return found


def tokenize(text: str) -> set[str]:
    return set(TOKEN_RE.findall(text.casefold()))


def classify(word: str, definition: str) -> tuple[str | None, int]:
    word_tokens = tokenize(word)
    definition_tokens = tokenize(definition)
    best_topic = None
    best_score = 0
    for topic, keywords in TOPIC_KEYWORDS.items():
        direct_hits = len(word_tokens & keywords)
        context_hits = len(definition_tokens & keywords)
        score = direct_hits * 5 + min(context_hits, 5)
        if score > best_score:
            best_topic, best_score = topic, score
    return best_topic, best_score


def candidate_words(source_path: Path, existing: dict[str, set[str]], target: int):
    candidates: dict[str, list[tuple[int, int, int, str, str, str, str]]] = {
        topic: [] for topic in TOPIC_KEYWORDS
    }
    used = set().union(*existing.values())
    with source_path.open("r", encoding="utf-8-sig", newline="") as source:
        reader = csv.DictReader(source)
        required = {"word", "definition", "frq", "tag", "phonetic", "pos"}
        if not reader.fieldnames or not required.issubset(reader.fieldnames):
            raise RuntimeError("ECDICT CSV is missing required columns.")

        for row in reader:
            word = (row.get("word") or "").strip()
            raw_definition = row.get("definition") or ""
            definition, detected_pos = parse_ecdict_definition(
                raw_definition, row.get("pos") or ""
            )
            normalized_pos = part_of_speech(detected_pos)
            key = word.casefold()
            if (
                not WORD_RE.fullmatch(word)
                or not definition
                or normalized_pos not in {"n", "v", "adj", "adv"}
                or key in used
            ):
                continue
            topic, score = classify(word, definition)
            if topic is None or score < (1 if topic == "Marketing" else 2):
                continue
            try:
                frequency = int(row.get("frq") or 0)
            except ValueError:
                frequency = 0
            tags = (row.get("tag") or "").casefold()
            exam_bonus = 0 if any(tag in tags for tag in ("cet4", "cet6", "toefl", "ielts")) else 1
            candidates[topic].append(
                (
                    score,
                    exam_bonus,
                    frequency or 999999,
                    word,
                    definition,
                    row.get("phonetic") or "",
                    detected_pos,
                )
            )
            used.add(key)

    for topic in candidates:
        candidates[topic].sort(
            key=lambda item: (-item[0], item[1], item[2], item[3].casefold())
        )
        candidates[topic] = candidates[topic][: max(200, (target - len(existing[topic])) * 8)]
    return candidates


def part_of_speech(value: str) -> str:
    for candidate in value.split("/"):
        abbreviation = candidate.split(":", 1)[0].strip().casefold()
        normalized = PARTS_OF_SPEECH.get(abbreviation)
        if normalized in {"n", "v", "adj", "adv"}:
            return normalized
    return ""


def generated_example(topic: str, word: str, part_of_speech: str) -> str:
    index = {"n": 0, "v": 1, "adj": 2, "adv": 0}[part_of_speech]
    template = EXAMPLE_TEMPLATES[topic][index][0]
    return template.format(word=word)


def split_gloss_options(glosses: list[str]) -> list[str]:
    options = []
    for gloss in glosses:
        for section in gloss.split(";"):
            option = []
            depth = 0
            for character in section:
                if character == "," and depth == 0:
                    value = "".join(option).strip()
                    if value:
                        options.append(value)
                    option = []
                    continue
                if character == "(":
                    depth += 1
                elif character == ")" and depth:
                    depth -= 1
                option.append(character)
            value = "".join(option).strip()
            if value:
                options.append(value)
    return options


def vietnamese_gloss(word: str, topic: str, cache: dict) -> str | None:
    cache_key = "en-vi-gloss-v3:" + topic + ":" + word.casefold()
    if cache_key in cache:
        return cache[cache_key]
    if (topic, word.casefold()) in WORD_VI_OVERRIDES:
        meaning = WORD_VI_OVERRIDES[(topic, word.casefold())]
        cache[cache_key] = meaning
        return meaning

    url = VIETNAMESE_DICTIONARY_URL.format(quote(word.casefold(), safe=""))
    try:
        payload = json.loads(request_bytes(url).decode("utf-8"))
    except HTTPError as error:
        if error.code != 404:
            raise
        cache[cache_key] = None
        return None

    content = payload.get("en_vn", {}).get("data", {}).get("content")
    if not isinstance(content, str) or not content.strip():
        cache[cache_key] = None
        return None
    parser = VietnameseGlossParser()
    parser.feed(content)
    glosses = list(dict.fromkeys(parser.meanings))
    gloss_options = split_gloss_options(glosses)
    selected = None
    for hint in TOPIC_VI_HINTS[topic]:
        matches = [gloss for gloss in gloss_options if hint in gloss.casefold()]
        selected = min(matches, key=len) if matches else None
        if selected:
            break
    if selected is None and glosses:
        selected = gloss_options[0] if gloss_options else glosses[0]
    meaning = selected
    cache[cache_key] = meaning
    return meaning


def dictionary_phonetic(word: str, cache: dict) -> str | None:
    cache_key = "en-ipa-v1:" + word.casefold()
    if cache_key in cache:
        return cache[cache_key]

    url = FREE_DICTIONARY_URL.format(quote(word.casefold(), safe=""))
    try:
        payload = json.loads(request_bytes(url).decode("utf-8"))
    except HTTPError as error:
        if error.code != 404:
            raise
        cache[cache_key] = None
        return None

    pronunciations = []
    if isinstance(payload, list):
        for entry in payload:
            if entry.get("phonetic"):
                pronunciations.append(entry["phonetic"])
            pronunciations.extend(
                item["text"]
                for item in entry.get("phonetics", [])
                if item.get("text")
            )
    phonetic = next(iter(dict.fromkeys(pronunciations)), None)
    cache[cache_key] = phonetic
    return phonetic


def translated_example(topic: str, word: str, part: str, gloss: str) -> str:
    index = {"n": 0, "v": 1, "adj": 2, "adv": 0}[part]
    template = EXAMPLE_TEMPLATES[topic][index][1]
    meaning = gloss.split(";", 1)[0].strip()
    return template.format(word=word, meaning=meaning)


def sql_value(value: str) -> str:
    value = re.sub(r"[\r\n\t]+", " ", value).strip()
    return "'" + value.replace("'", "''") + "'"


def sql_insert(topic: str, item: dict[str, str]) -> str:
    values = [
        sql_value(item["word"]),
        sql_value(item["phonetic"]),
        sql_value(item["part_of_speech"]),
        sql_value(item["meaning_vi"]),
        sql_value(item["definition_en"]),
        sql_value(item["example_sentence"]),
        sql_value(item["example_meaning"]),
        "NULL",
        "NULL",
    ]
    return (
        "INSERT IGNORE INTO vocab_words "
        "(topic_id, word, phonetic, part_of_speech, meaning_vi, definition_en, "
        "example_sentence, example_meaning, audio_url, image_url) "
        "SELECT t.id, "
        + ", ".join(values)
        + " FROM vocab_topics t WHERE t.title = "
        + sql_value(topic)
        + ";\n"
    )


def save_cache(cache_path: Path, cache: dict) -> None:
    cache_path.write_text(
        json.dumps(cache, ensure_ascii=False, indent=2), encoding="utf-8"
    )


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--target-per-topic", type=int, default=60)
    parser.add_argument("--delay", type=float, default=0.1)
    parser.add_argument(
        "--cache-dir",
        type=Path,
        default=Path(os.environ.get("LOCALAPPDATA", Path.home()))
        / "n11-toeic-vocab-cache",
    )
    args = parser.parse_args()
    if args.target_per_topic < 1 or args.delay < 0:
        parser.error("--target-per-topic must be positive and --delay cannot be negative")

    sql_text = SQL_FILE.read_text(encoding="utf-8")
    existing = words_in_seed(sql_text)
    if all(len(words) >= args.target_per_topic for words in existing.values()):
        print(f"All topics already contain at least {args.target_per_topic} words.")
        return 0
    source_path = download_source(args.cache_dir)
    candidates = candidate_words(source_path, existing, args.target_per_topic)
    cache_path = args.cache_dir / "api-cache.json"
    cache = json.loads(cache_path.read_text(encoding="utf-8")) if cache_path.exists() else {}
    additions: dict[str, list[dict[str, str]]] = {topic: [] for topic in TOPIC_KEYWORDS}
    lookups_since_save = 0

    for topic, options in candidates.items():
        needed = max(0, args.target_per_topic - len(existing[topic]))
        for _, _, _, word, definition_en, phonetic, ecdict_pos in options:
            if len(additions[topic]) >= needed:
                break
            part = part_of_speech(ecdict_pos)
            if not part:
                continue
            example = generated_example(topic, word, part)
            try:
                meaning_vi = vietnamese_gloss(word, topic, cache)
                lookups_since_save += 1
                if not meaning_vi:
                    if lookups_since_save >= 10:
                        save_cache(cache_path, cache)
                        lookups_since_save = 0
                    continue
                if not phonetic:
                    phonetic = dictionary_phonetic(word, cache) or ""
                    lookups_since_save += 1
                if lookups_since_save >= 10:
                    save_cache(cache_path, cache)
                    lookups_since_save = 0
                if not phonetic:
                    continue
            except (HTTPError, URLError, TimeoutError, OSError, json.JSONDecodeError):
                save_cache(cache_path, cache)
                raise
            example_meaning = translated_example(topic, word, part, meaning_vi)

            additions[topic].append(
                {
                    "word": word,
                    "phonetic": phonetic,
                    "part_of_speech": part,
                    "meaning_vi": meaning_vi,
                    "definition_en": definition_en,
                    "example_sentence": example,
                    "example_meaning": example_meaning,
                }
            )
            time.sleep(args.delay)

        print(f"{topic}: {len(existing[topic])} existing + {len(additions[topic])} generated")
        save_cache(cache_path, cache)
        if len(existing[topic]) + len(additions[topic]) < args.target_per_topic:
            cache_path.write_text(
                json.dumps(cache, ensure_ascii=False, indent=2), encoding="utf-8"
            )
            raise RuntimeError(
                f"Only generated {len(additions[topic])} new words for {topic}; "
                "increase the source candidate pool or review TOPIC_KEYWORDS."
            )

    attribution = (
        "\n-- Generated by scripts/generate_vocab_sql.py.\n"
        "-- Candidate words, IPA, POS and English definitions: ECDICT (MIT), "
        "https://github.com/skywind3000/ECDICT.\n"
        "-- Vietnamese word glosses: open-vn-en-dict (MIT), "
        "https://github.com/samuraitruong/open-vn-en-dict.\n"
        "-- Fallback IPA: Free Dictionary API (Wiktionary, CC BY-SA 3.0), "
        "https://dictionaryapi.dev/.\n"
        "-- Example sentences and Vietnamese meanings are generated from topic-specific templates.\n"
    )
    output = [attribution]
    for topic, items in additions.items():
        output.append(f"\n-- Additional TOEIC words: {topic}\n")
        output.extend(sql_insert(topic, item) for item in items)

    with SQL_FILE.open("a", encoding="utf-8", newline="\n") as target:
        target.write("".join(output))
    save_cache(cache_path, cache)
    total = sum(len(words) for words in existing.values()) + sum(
        len(items) for items in additions.values()
    )
    print(f"Appended {sum(map(len, additions.values()))} words; total target count: {total}.")
    print(f"Updated {SQL_FILE}")
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except (HTTPError, URLError, TimeoutError, OSError, RuntimeError) as error:
        print(f"Error: {error}", file=sys.stderr)
        raise SystemExit(1) from error
