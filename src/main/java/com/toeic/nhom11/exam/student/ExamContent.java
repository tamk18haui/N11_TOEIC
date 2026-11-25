package com.toeic.nhom11.exam.student;

import tools.jackson.databind.JsonNode;
import tools.jackson.databind.json.JsonMapper;

import java.net.URI;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

final class ExamContent {
    private static final JsonMapper JSON=JsonMapper.builder().build();
    private static final Pattern GAP=Pattern.compile("\\[(\\d{1,3})\\]");

    private ExamContent() {}

    static String passage(Object value) {
        String raw=plain(value);
        if (!structured(raw)) return raw;
        JsonNode data=parse(raw);
        if (data==null) return "";
        var sections=new ArrayList<String>();
        for (JsonNode document:data.path("documents")) {
            var lines=englishLines(document);
            if (!lines.isEmpty()) {
                prependTitle(lines,document);
                sections.add(String.join("\n",lines));
            }
        }
        if (sections.isEmpty()) sections.addAll(englishLines(data));
        if (sections.isEmpty()) return "";
        prependTitle(sections,data);
        return String.join("\n\n",sections);
    }

    static String explanation(Object value) {
        String raw=plain(value);
        if (!structured(raw)) return raw;
        JsonNode data=parse(raw);
        return data==null ? "" : text(data.path("explanation"));
    }

    static String gapNumber(Object text) {
        var match=GAP.matcher(plain(text));
        return match.find() ? match.group(1) : "";
    }

    static String renumberGaps(String text,Map<String,String> numbers) {
        if (numbers.isEmpty()) return text;
        return GAP.matcher(text).replaceAll(match -> numbers.containsKey(match.group(1))
            ? "["+numbers.get(match.group(1))+"]" : match.group());
    }

    static String plain(Object value) {
        return value==null ? "" : value.toString().trim();
    }

    static String media(Object value) {
        String raw=plain(value);
        if (raw.startsWith("/") && !raw.startsWith("//") && !raw.contains("\\")) return raw;
        try {
            URI uri=URI.create(raw);
            String scheme=uri.getScheme();
            if (("https".equalsIgnoreCase(scheme) || "http".equalsIgnoreCase(scheme))
                && uri.getHost()!=null && uri.getUserInfo()==null) return raw;
        } catch (IllegalArgumentException invalid) {
            return "";
        }
        return "";
    }

    private static List<String> englishLines(JsonNode node) {
        var lines=new ArrayList<String>();
        for (JsonNode line:node.path("lines")) {
            String english=text(line.path("en"));
            if (!english.isBlank()) lines.add(english);
        }
        return lines;
    }

    private static void prependTitle(List<String> lines,JsonNode node) {
        String title=text(node.path("title"));
        if (!title.isBlank()) lines.addFirst(title);
    }

    private static String text(JsonNode node) {
        return node.isString() ? node.asString().trim() : "";
    }

    private static boolean structured(String raw) {
        return raw.startsWith("{") || raw.startsWith("[{");
    }

    private static JsonNode parse(String raw) {
        try {
            return JSON.readTree(raw);
        } catch (tools.jackson.core.JacksonException invalid) {
            return null;
        }
    }
}
