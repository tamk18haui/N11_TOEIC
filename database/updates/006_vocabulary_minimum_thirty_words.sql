-- Vocabulary minimum-thirty migration. Re-runnable for MySQL 8 and H2.

INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'applicant' AS word, 'á»©ng viĂªn' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how applicant relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a applicant vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'career' AS word, 'sá»± nghiá»‡p' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how career relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a career vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'deadline' AS word, 'háº¡n chĂ³t' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how deadline relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a deadline vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'employee' AS word, 'nhĂ¢n viĂªn' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how employee relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a employee vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'employer' AS word, 'nhĂ  tuyá»ƒn dá»¥ng' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how employer relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a employer vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'manager' AS word, 'ngÆ°á»i quáº£n lĂ½' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how manager relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a manager vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'promotion' AS word, 'sá»± thÄƒng tiáº¿n' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how promotion relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a promotion vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'salary' AS word, 'lÆ°Æ¡ng' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how salary relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a salary vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'shift' AS word, 'ca lĂ m viá»‡c' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how shift relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a shift vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'vacancy' AS word, 'vá»‹ trĂ­ tuyá»ƒn dá»¥ng' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how vacancy relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a vacancy vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'recruitment' AS word, 'tuyá»ƒn dá»¥ng' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how recruitment relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a recruitment vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'qualification' AS word, 'trĂ¬nh Ä‘á»™' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how qualification relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a qualification vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'experience' AS word, 'kinh nghiá»‡m' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how experience relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a experience vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'interview' AS word, 'phá»ng váº¥n' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how interview relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a interview vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'contract' AS word, 'há»£p Ä‘á»“ng' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how contract relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a contract vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'supervisor' AS word, 'ngÆ°á»i giĂ¡m sĂ¡t' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how supervisor relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a supervisor vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'colleague' AS word, 'Ä‘á»“ng nghiá»‡p' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how colleague relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a colleague vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'workload' AS word, 'khá»‘i lÆ°á»£ng cĂ´ng viá»‡c' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how workload relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a workload vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'overtime' AS word, 'giá» lĂ m thĂªm' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how overtime relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a overtime vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'resignation' AS word, 'Ä‘Æ¡n tá»« chá»©c' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how resignation relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a resignation vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'performance' AS word, 'hiá»‡u suáº¥t' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how performance relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a performance vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'responsibility' AS word, 'trĂ¡ch nhiá»‡m' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how responsibility relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a responsibility vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'training' AS word, 'Ä‘Ă o táº¡o' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how training relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a training vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'internship' AS word, 'thá»±c táº­p' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how internship relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a internship vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'payroll' AS word, 'báº£ng lÆ°Æ¡ng' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how payroll relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a payroll vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'workplace' AS word, 'nÆ¡i lĂ m viá»‡c' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how workplace relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a workplace vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'personnel' AS word, 'nhĂ¢n sá»±' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how personnel relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a personnel vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'conference' AS word, 'há»™i nghá»‹' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how conference relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a conference vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'procedure' AS word, 'quy trĂ¬nh' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how procedure relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a procedure vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'appointment' AS word, 'cuá»™c háº¹n' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how appointment relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a appointment vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
) terms
WHERE topic.id=1
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'airline' AS word, 'hĂ£ng hĂ ng khĂ´ng' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how airline relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a airline vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'flight' AS word, 'chuyáº¿n bay' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how flight relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a flight vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'airport' AS word, 'sĂ¢n bay' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how airport relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a airport vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'passport' AS word, 'há»™ chiáº¿u' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how passport relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a passport vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'ticket' AS word, 'vĂ©' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how ticket relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a ticket vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'departure' AS word, 'sá»± khá»Ÿi hĂ nh' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how departure relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a departure vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'arrival' AS word, 'sá»± Ä‘áº¿n nÆ¡i' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how arrival relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a arrival vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'destination' AS word, 'Ä‘iá»ƒm Ä‘áº¿n' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how destination relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a destination vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'itinerary' AS word, 'lá»‹ch trĂ¬nh chuyáº¿n Ä‘i' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how itinerary relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a itinerary vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'accommodation' AS word, 'chá»— á»Ÿ' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how accommodation relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a accommodation vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'reservation' AS word, 'Ä‘áº·t chá»—' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how reservation relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a reservation vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'boarding pass' AS word, 'tháº» lĂªn mĂ¡y bay' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how boarding pass relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a boarding pass vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'luggage' AS word, 'hĂ nh lĂ½' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how luggage relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a luggage vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'baggage allowance' AS word, 'háº¡n má»©c hĂ nh lĂ½' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how baggage allowance relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a baggage allowance vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'layover' AS word, 'quĂ¡ cáº£nh' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how layover relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a layover vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'transfer' AS word, 'chuyá»ƒn tuyáº¿n' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how transfer relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a transfer vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'commute' AS word, 'Ä‘i láº¡i háº±ng ngĂ y' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how commute relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a commute vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'subway' AS word, 'tĂ u Ä‘iá»‡n ngáº§m' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how subway relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a subway vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'platform' AS word, 'sĂ¢n ga' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how platform relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a platform vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'fare' AS word, 'giĂ¡ vĂ©' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how fare relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a fare vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'terminal' AS word, 'nhĂ  ga' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how terminal relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a terminal vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'route' AS word, 'tuyáº¿n Ä‘Æ°á»ng' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how route relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a route vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'vehicle' AS word, 'phÆ°Æ¡ng tiá»‡n' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how vehicle relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a vehicle vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'traffic' AS word, 'giao thĂ´ng' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how traffic relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a traffic vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'congestion' AS word, 'Ă¹n táº¯c' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how congestion relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a congestion vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'pedestrian' AS word, 'ngÆ°á»i Ä‘i bá»™' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how pedestrian relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a pedestrian vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'ferry' AS word, 'phĂ' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how ferry relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a ferry vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'schedule' AS word, 'lá»‹ch trĂ¬nh' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how schedule relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a schedule vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'delay' AS word, 'sá»± trá»… chuyáº¿n' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how delay relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a delay vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'tourist' AS word, 'khĂ¡ch du lá»‹ch' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how tourist relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a tourist vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
) terms
WHERE topic.id=2
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'customer' AS word, 'khĂ¡ch hĂ ng' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how customer relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a customer vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'purchase' AS word, 'mua hĂ ng' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how purchase relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a purchase vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'price' AS word, 'giĂ¡' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how price relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a price vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'receipt' AS word, 'biĂªn lai' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how receipt relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a receipt vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'refund' AS word, 'hoĂ n tiá»n' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how refund relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a refund vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'discount' AS word, 'chiáº¿t kháº¥u' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how discount relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a discount vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'cashier' AS word, 'thu ngĂ¢n' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how cashier relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a cashier vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'delivery' AS word, 'giao hĂ ng' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how delivery relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a delivery vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'sale' AS word, 'Ä‘á»£t giáº£m giĂ¡' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how sale relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a sale vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'vendor' AS word, 'nhĂ  cung cáº¥p' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how vendor relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a vendor vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'retailer' AS word, 'nhĂ  bĂ¡n láº»' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how retailer relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a retailer vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'wholesale' AS word, 'bĂ¡n buĂ´n' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how wholesale relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a wholesale vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'product' AS word, 'sáº£n pháº©m' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how product relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a product vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'warranty' AS word, 'báº£o hĂ nh' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how warranty relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a warranty vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'guarantee' AS word, 'sá»± Ä‘áº£m báº£o' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how guarantee relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a guarantee vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'invoice' AS word, 'hĂ³a Ä‘Æ¡n' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how invoice relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a invoice vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'payment' AS word, 'thanh toĂ¡n' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how payment relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a payment vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'checkout' AS word, 'quáº§y thanh toĂ¡n' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how checkout relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a checkout vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'basket' AS word, 'giá» hĂ ng' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how basket relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a basket vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'complaint' AS word, 'khiáº¿u náº¡i' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how complaint relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a complaint vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'consumer' AS word, 'ngÆ°á»i tiĂªu dĂ¹ng' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how consumer relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a consumer vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'demand' AS word, 'nhu cáº§u' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how demand relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a demand vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'supply' AS word, 'nguá»“n cung' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how supply relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a supply vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'budget' AS word, 'ngĂ¢n sĂ¡ch' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how budget relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a budget vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'expenditure' AS word, 'chi tiĂªu' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how expenditure relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a expenditure vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'bargain' AS word, 'mĂ³n há»i' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how bargain relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a bargain vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'brand' AS word, 'thÆ°Æ¡ng hiá»‡u' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how brand relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a brand vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'quality' AS word, 'cháº¥t lÆ°á»£ng' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how quality relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a quality vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'availability' AS word, 'sá»± sáºµn cĂ³' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how availability relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a availability vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'subscription' AS word, 'gĂ³i Ä‘Äƒng kĂ½' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how subscription relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a subscription vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
) terms
WHERE topic.id=3
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'curriculum' AS word, 'chÆ°Æ¡ng trĂ¬nh há»c' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how curriculum relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a curriculum vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'syllabus' AS word, 'Ä‘á» cÆ°Æ¡ng' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how syllabus relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a syllabus vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'tuition' AS word, 'há»c phĂ­' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how tuition relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a tuition vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'scholarship' AS word, 'há»c bá»•ng' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how scholarship relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a scholarship vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'assignment' AS word, 'bĂ i táº­p' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how assignment relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a assignment vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'lecture' AS word, 'bĂ i giáº£ng' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how lecture relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a lecture vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'seminar' AS word, 'há»™i tháº£o' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how seminar relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a seminar vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'assessment' AS word, 'Ä‘Ă¡nh giĂ¡' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how assessment relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a assessment vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'graduate' AS word, 'tá»‘t nghiá»‡p' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how graduate relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a graduate vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'undergraduate' AS word, 'sinh viĂªn Ä‘áº¡i há»c' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how undergraduate relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a undergraduate vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'postgraduate' AS word, 'sau Ä‘áº¡i há»c' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how postgraduate relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a postgraduate vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'discipline' AS word, 'mĂ´n há»c' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how discipline relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a discipline vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'literacy' AS word, 'trĂ¬nh Ä‘á»™ Ä‘á»c viáº¿t' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how literacy relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a literacy vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'qualification' AS word, 'báº±ng cáº¥p' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how qualification relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a qualification vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'academic' AS word, 'há»c thuáº­t' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how academic relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a academic vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'campus' AS word, 'khuĂ´n viĂªn' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how campus relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a campus vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'faculty' AS word, 'giáº£ng viĂªn' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how faculty relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a faculty vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'enrollment' AS word, 'ghi danh' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how enrollment relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a enrollment vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'attendance' AS word, 'chuyĂªn cáº§n' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how attendance relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a attendance vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'revision' AS word, 'Ă´n táº­p' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how revision relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a revision vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'research' AS word, 'nghiĂªn cá»©u' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how research relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a research vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'laboratory' AS word, 'phĂ²ng thĂ­ nghiá»‡m' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how laboratory relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a laboratory vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'classroom' AS word, 'lá»›p há»c' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how classroom relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a classroom vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'teacher' AS word, 'giĂ¡o viĂªn' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how teacher relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a teacher vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'pupil' AS word, 'há»c sinh' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how pupil relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a pupil vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'examination' AS word, 'ká»³ thi' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how examination relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a examination vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'certificate' AS word, 'chá»©ng chá»‰' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how certificate relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a certificate vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'knowledge' AS word, 'kiáº¿n thá»©c' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how knowledge relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a knowledge vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'skill' AS word, 'ká»¹ nÄƒng' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how skill relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a skill vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'distance learning' AS word, 'há»c tá»« xa' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how distance learning relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a distance learning vá»›i chá»§ Ä‘á» Education.' AS example_vi
) terms
WHERE topic.id=4
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'environment' AS word, 'mĂ´i trÆ°á»ng' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how environment relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a environment vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'pollution' AS word, 'Ă´ nhiá»…m' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how pollution relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a pollution vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'conservation' AS word, 'báº£o tá»“n' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how conservation relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a conservation vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'biodiversity' AS word, 'Ä‘a dáº¡ng sinh há»c' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how biodiversity relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a biodiversity vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'ecosystem' AS word, 'há»‡ sinh thĂ¡i' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how ecosystem relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a ecosystem vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'habitat' AS word, 'mĂ´i trÆ°á»ng sá»‘ng' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how habitat relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a habitat vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'renewable' AS word, 'tĂ¡i táº¡o Ä‘Æ°á»£c' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how renewable relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a renewable vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'recycle' AS word, 'tĂ¡i cháº¿' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how recycle relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a recycle vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'waste' AS word, 'cháº¥t tháº£i' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how waste relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a waste vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'emission' AS word, 'khĂ­ tháº£i' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how emission relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a emission vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'carbon footprint' AS word, 'dáº¥u chĂ¢n carbon' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how carbon footprint relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a carbon footprint vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'deforestation' AS word, 'phĂ¡ rá»«ng' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how deforestation relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a deforestation vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'sustainability' AS word, 'tĂ­nh bá»n vá»¯ng' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how sustainability relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a sustainability vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'contamination' AS word, 'nhiá»…m báº©n' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how contamination relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a contamination vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'preservation' AS word, 'gĂ¬n giá»¯' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how preservation relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a preservation vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'climate' AS word, 'khĂ­ háº­u' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how climate relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a climate vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'atmosphere' AS word, 'khĂ­ quyá»ƒn' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how atmosphere relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a atmosphere vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'wildlife' AS word, 'Ä‘á»™ng váº­t hoang dĂ£' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how wildlife relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a wildlife vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'soil erosion' AS word, 'xĂ³i mĂ²n Ä‘áº¥t' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how soil erosion relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a soil erosion vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'sustainable' AS word, 'bá»n vá»¯ng' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how sustainable relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a sustainable vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'greenhouse gas' AS word, 'khĂ­ nhĂ  kĂ­nh' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how greenhouse gas relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a greenhouse gas vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'fossil fuel' AS word, 'nhiĂªn liá»‡u hĂ³a tháº¡ch' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how fossil fuel relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a fossil fuel vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'organic' AS word, 'há»¯u cÆ¡' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how organic relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a organic vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'dumping' AS word, 'xáº£ tháº£i' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how dumping relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a dumping vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'landfill' AS word, 'bĂ£i chĂ´n láº¥p' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how landfill relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a landfill vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'resource' AS word, 'tĂ i nguyĂªn' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how resource relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a resource vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'drought' AS word, 'háº¡n hĂ¡n' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how drought relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a drought vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'flooding' AS word, 'lá»¥t' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how flooding relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a flooding vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'ozone layer' AS word, 'táº§ng ozone' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how ozone layer relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a ozone layer vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'extinction' AS word, 'tuyá»‡t chá»§ng' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how extinction relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a extinction vá»›i chá»§ Ä‘á» Environment.' AS example_vi
) terms
WHERE topic.id=5
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'healthcare' AS word, 'chÄƒm sĂ³c sá»©c khá»e' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how healthcare relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a healthcare vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'well-being' AS word, 'sá»©c khá»e tinh tháº§n vĂ  thá»ƒ cháº¥t' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how well-being relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a well-being vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'nutrition' AS word, 'dinh dÆ°á»¡ng' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how nutrition relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a nutrition vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'exercise' AS word, 'táº­p thá»ƒ dá»¥c' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how exercise relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a exercise vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'fitness' AS word, 'thá»ƒ lá»±c' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how fitness relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a fitness vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'disease' AS word, 'bá»‡nh' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how disease relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a disease vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'infection' AS word, 'nhiá»…m trĂ¹ng' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how infection relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a infection vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'treatment' AS word, 'Ä‘iá»u trá»‹' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how treatment relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a treatment vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'prescription' AS word, 'Ä‘Æ¡n thuá»‘c' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how prescription relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a prescription vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'diagnosis' AS word, 'cháº©n Ä‘oĂ¡n' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how diagnosis relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a diagnosis vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'prevention' AS word, 'phĂ²ng ngá»«a' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how prevention relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a prevention vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'immunity' AS word, 'miá»…n dá»‹ch' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how immunity relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a immunity vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'vaccination' AS word, 'tiĂªm chá»§ng' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how vaccination relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a vaccination vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'symptom' AS word, 'triá»‡u chá»©ng' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how symptom relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a symptom vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'therapy' AS word, 'trá»‹ liá»‡u' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how therapy relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a therapy vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'recovery' AS word, 'há»“i phá»¥c' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how recovery relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a recovery vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'patient' AS word, 'bá»‡nh nhĂ¢n' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how patient relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a patient vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'physician' AS word, 'bĂ¡c sÄ©' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how physician relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a physician vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'nurse' AS word, 'y tĂ¡' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how nurse relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a nurse vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'hospital' AS word, 'bá»‡nh viá»‡n' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how hospital relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a hospital vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'clinic' AS word, 'phĂ²ng khĂ¡m' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how clinic relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a clinic vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'medicine' AS word, 'thuá»‘c' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how medicine relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a medicine vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'mental health' AS word, 'sá»©c khá»e tĂ¢m tháº§n' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how mental health relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a mental health vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'stress' AS word, 'cÄƒng tháº³ng' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how stress relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a stress vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'anxiety' AS word, 'lo Ă¢u' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how anxiety relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a anxiety vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'insomnia' AS word, 'máº¥t ngá»§' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how insomnia relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a insomnia vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'diet' AS word, 'cháº¿ Ä‘á»™ Äƒn' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how diet relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a diet vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'hygiene' AS word, 'vá»‡ sinh' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how hygiene relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a hygiene vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'allergy' AS word, 'dá»‹ á»©ng' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how allergy relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a allergy vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'balance' AS word, 'sá»± cĂ¢n báº±ng' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how balance relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a balance vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
) terms
WHERE topic.id=6
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'innovation' AS word, 'Ä‘á»•i má»›i' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how innovation relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a innovation vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'device' AS word, 'thiáº¿t bá»‹' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how device relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a device vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'software' AS word, 'pháº§n má»m' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how software relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a software vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'hardware' AS word, 'pháº§n cá»©ng' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how hardware relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a hardware vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'database' AS word, 'cÆ¡ sá»Ÿ dá»¯ liá»‡u' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how database relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a database vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'network' AS word, 'máº¡ng' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how network relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a network vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'artificial intelligence' AS word, 'trĂ­ tuá»‡ nhĂ¢n táº¡o' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how artificial intelligence relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a artificial intelligence vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'automation' AS word, 'tá»± Ä‘á»™ng hĂ³a' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how automation relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a automation vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'algorithm' AS word, 'thuáº­t toĂ¡n' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how algorithm relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a algorithm vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'cybersecurity' AS word, 'an ninh máº¡ng' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how cybersecurity relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a cybersecurity vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'cloud computing' AS word, 'Ä‘iá»‡n toĂ¡n Ä‘Ă¡m mĂ¢y' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how cloud computing relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a cloud computing vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'application' AS word, 'á»©ng dá»¥ng' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how application relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a application vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'interface' AS word, 'giao diá»‡n' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how interface relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a interface vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'update' AS word, 'cáº­p nháº­t' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how update relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a update vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'digital' AS word, 'ká»¹ thuáº­t sá»‘' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how digital relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a digital vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'connection' AS word, 'káº¿t ná»‘i' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how connection relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a connection vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'server' AS word, 'mĂ¡y chá»§' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how server relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a server vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'bandwidth' AS word, 'bÄƒng thĂ´ng' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how bandwidth relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a bandwidth vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'encryption' AS word, 'mĂ£ hĂ³a' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how encryption relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a encryption vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'privacy' AS word, 'quyá»n riĂªng tÆ°' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how privacy relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a privacy vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'malware' AS word, 'pháº§n má»m Ä‘á»™c háº¡i' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how malware relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a malware vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'backup' AS word, 'sao lÆ°u' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how backup relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a backup vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'device compatibility' AS word, 'tĂ­nh tÆ°Æ¡ng thĂ­ch thiáº¿t bá»‹' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how device compatibility relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a device compatibility vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'smartphone' AS word, 'Ä‘iá»‡n thoáº¡i thĂ´ng minh' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how smartphone relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a smartphone vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'robotics' AS word, 'ngĂ nh robot' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how robotics relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a robotics vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'data' AS word, 'dá»¯ liá»‡u' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how data relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a data vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'virtual reality' AS word, 'thá»±c táº¿ áº£o' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how virtual reality relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a virtual reality vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'streaming' AS word, 'truyá»n phĂ¡t' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how streaming relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a streaming vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'browser' AS word, 'trĂ¬nh duyá»‡t' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how browser relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a browser vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'wireless' AS word, 'khĂ´ng dĂ¢y' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how wireless relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a wireless vá»›i chá»§ Ä‘á» Technology.' AS example_vi
) terms
WHERE topic.id=7
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'community' AS word, 'cá»™ng Ä‘á»“ng' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how community relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a community vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'population' AS word, 'dĂ¢n sá»‘' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how population relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a population vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'citizen' AS word, 'cĂ´ng dĂ¢n' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how citizen relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a citizen vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'immigration' AS word, 'nháº­p cÆ°' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how immigration relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a immigration vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'inequality' AS word, 'báº¥t bĂ¬nh Ä‘áº³ng' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how inequality relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a inequality vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'poverty' AS word, 'nghĂ¨o Ä‘Ă³i' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how poverty relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a poverty vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'welfare' AS word, 'phĂºc lá»£i' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how welfare relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a welfare vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'diversity' AS word, 'sá»± Ä‘a dáº¡ng' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how diversity relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a diversity vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'social issue' AS word, 'váº¥n Ä‘á» xĂ£ há»™i' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how social issue relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a social issue vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'democracy' AS word, 'dĂ¢n chá»§' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how democracy relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a democracy vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'participation' AS word, 'sá»± tham gia' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how participation relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a participation vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'volunteer' AS word, 'tĂ¬nh nguyá»‡n viĂªn' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how volunteer relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a volunteer vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'charity' AS word, 'tá»« thiá»‡n' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how charity relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a charity vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'discrimination' AS word, 'phĂ¢n biá»‡t Ä‘á»‘i xá»­' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how discrimination relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a discrimination vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'inclusion' AS word, 'sá»± hĂ²a nháº­p' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how inclusion relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a inclusion vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'equality' AS word, 'bĂ¬nh Ä‘áº³ng' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how equality relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a equality vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'generation' AS word, 'tháº¿ há»‡' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how generation relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a generation vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'minority' AS word, 'thiá»ƒu sá»‘' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how minority relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a minority vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'majority' AS word, 'Ä‘a sá»‘' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how majority relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a majority vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'public opinion' AS word, 'dÆ° luáº­n' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how public opinion relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a public opinion vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'social network' AS word, 'máº¡ng xĂ£ há»™i' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how social network relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a social network vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'tradition' AS word, 'truyá»n thá»‘ng' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how tradition relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a tradition vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'identity' AS word, 'báº£n sáº¯c' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how identity relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a identity vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'mobility' AS word, 'sá»± dá»‹ch chuyá»ƒn' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how mobility relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a mobility vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'census' AS word, 'Ä‘iá»u tra dĂ¢n sá»‘' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how census relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a census vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'urban society' AS word, 'xĂ£ há»™i Ä‘Ă´ thá»‹' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how urban society relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a urban society vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'neighborhood' AS word, 'khu phá»‘' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how neighborhood relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a neighborhood vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'cooperation' AS word, 'há»£p tĂ¡c' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how cooperation relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a cooperation vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'security' AS word, 'an ninh' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how security relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a security vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'solidarity' AS word, 'Ä‘oĂ n káº¿t' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how solidarity relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a solidarity vá»›i chá»§ Ä‘á» Society.' AS example_vi
) terms
WHERE topic.id=8
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'culture' AS word, 'vÄƒn hĂ³a' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how culture relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a culture vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'tradition' AS word, 'truyá»n thá»‘ng' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how tradition relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a tradition vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'heritage' AS word, 'di sáº£n' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how heritage relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a heritage vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'custom' AS word, 'phong tá»¥c' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how custom relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a custom vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'ceremony' AS word, 'nghi lá»…' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how ceremony relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a ceremony vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'festival' AS word, 'lá»… há»™i' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how festival relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a festival vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'ritual' AS word, 'nghi thá»©c' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how ritual relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a ritual vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'folklore' AS word, 'vÄƒn hĂ³a dĂ¢n gian' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how folklore relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a folklore vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'craft' AS word, 'thá»§ cĂ´ng' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how craft relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a craft vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'artifacts' AS word, 'hiá»‡n váº­t' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how artifacts relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a artifacts vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'identity' AS word, 'báº£n sáº¯c' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how identity relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a identity vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'ancestor' AS word, 'tá»• tiĂªn' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how ancestor relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a ancestor vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'ceremonial' AS word, 'mang tĂ­nh nghi lá»…' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how ceremonial relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a ceremonial vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'ethnic' AS word, 'thuá»™c dĂ¢n tá»™c' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how ethnic relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a ethnic vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'cultural exchange' AS word, 'trao Ä‘á»•i vÄƒn hĂ³a' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how cultural exchange relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a cultural exchange vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'belief' AS word, 'niá»m tin' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how belief relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a belief vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'value' AS word, 'giĂ¡ trá»‹' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how value relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a value vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'celebration' AS word, 'lá»… ká»· niá»‡m' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how celebration relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a celebration vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'costume' AS word, 'trang phá»¥c' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how costume relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a costume vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'cuisine' AS word, 'áº©m thá»±c' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how cuisine relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a cuisine vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'handicraft' AS word, 'Ä‘á»“ thá»§ cĂ´ng' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how handicraft relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a handicraft vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'legend' AS word, 'truyá»n thuyáº¿t' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how legend relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a legend vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'monument' AS word, 'Ä‘Ă i tÆ°á»Ÿng niá»‡m' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how monument relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a monument vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'museum' AS word, 'báº£o tĂ ng' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how museum relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a museum vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'language' AS word, 'ngĂ´n ngá»¯' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how language relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a language vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'performance' AS word, 'biá»ƒu diá»…n' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how performance relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a performance vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'music' AS word, 'Ă¢m nháº¡c' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how music relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a music vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'dance' AS word, 'Ä‘iá»‡u mĂºa' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how dance relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a dance vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'hospitality' AS word, 'lĂ²ng hiáº¿u khĂ¡ch' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how hospitality relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a hospitality vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'preservation' AS word, 'báº£o tá»“n' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how preservation relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a preservation vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
) terms
WHERE topic.id=9
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'media' AS word, 'truyá»n thĂ´ng' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how media relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a media vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'journalism' AS word, 'bĂ¡o chĂ­' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how journalism relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a journalism vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'broadcast' AS word, 'phĂ¡t sĂ³ng' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how broadcast relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a broadcast vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'publication' AS word, 'áº¥n pháº©m' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how publication relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a publication vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'headline' AS word, 'tiĂªu Ä‘á»' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how headline relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a headline vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'audience' AS word, 'khĂ¡n giáº£' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how audience relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a audience vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'interview' AS word, 'phá»ng váº¥n' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how interview relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a interview vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'reporter' AS word, 'phĂ³ng viĂªn' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how reporter relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a reporter vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'editor' AS word, 'biĂªn táº­p viĂªn' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how editor relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a editor vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'advertisement' AS word, 'quáº£ng cĂ¡o' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how advertisement relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a advertisement vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'press release' AS word, 'thĂ´ng cĂ¡o bĂ¡o chĂ­' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how press release relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a press release vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'communication' AS word, 'giao tiáº¿p' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how communication relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a communication vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'message' AS word, 'thĂ´ng Ä‘iá»‡p' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how message relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a message vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'feedback' AS word, 'pháº£n há»“i' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how feedback relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a feedback vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'debate' AS word, 'tranh luáº­n' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how debate relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a debate vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'podcast' AS word, 'chÆ°Æ¡ng trĂ¬nh Ă¢m thanh' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how podcast relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a podcast vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'newsletter' AS word, 'báº£n tin' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how newsletter relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a newsletter vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'censorship' AS word, 'kiá»ƒm duyá»‡t' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how censorship relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a censorship vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'misinformation' AS word, 'thĂ´ng tin sai' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how misinformation relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a misinformation vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'credibility' AS word, 'Ä‘á»™ tin cáº­y' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how credibility relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a credibility vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'coverage' AS word, 'Ä‘Æ°a tin' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how coverage relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a coverage vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'subscriber' AS word, 'ngÆ°á»i Ä‘Äƒng kĂ½' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how subscriber relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a subscriber vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'influence' AS word, 'áº£nh hÆ°á»Ÿng' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how influence relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a influence vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'platform' AS word, 'ná»n táº£ng' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how platform relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a platform vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'social media' AS word, 'máº¡ng xĂ£ há»™i' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how social media relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a social media vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'content' AS word, 'ná»™i dung' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how content relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a content vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'channel' AS word, 'kĂªnh' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how channel relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a channel vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'broadcasting' AS word, 'phĂ¡t thanh truyá»n hĂ¬nh' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how broadcasting relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a broadcasting vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'caption' AS word, 'phá»¥ Ä‘á»' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how caption relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a caption vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'correspondent' AS word, 'phĂ³ng viĂªn thÆ°á»ng trĂº' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how correspondent relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a correspondent vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
) terms
WHERE topic.id=10
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'agriculture' AS word, 'nĂ´ng nghiá»‡p' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how agriculture relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a agriculture vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'nutrition' AS word, 'dinh dÆ°á»¡ng' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how nutrition relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a nutrition vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'crop' AS word, 'hoa mĂ u' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how crop relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a crop vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'harvest' AS word, 'thu hoáº¡ch' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how harvest relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a harvest vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'fertilizer' AS word, 'phĂ¢n bĂ³n' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how fertilizer relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a fertilizer vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'irrigation' AS word, 'tÆ°á»›i tiĂªu' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how irrigation relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a irrigation vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'livestock' AS word, 'gia sĂºc' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how livestock relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a livestock vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'organic' AS word, 'há»¯u cÆ¡' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how organic relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a organic vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'ingredient' AS word, 'nguyĂªn liá»‡u' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how ingredient relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a ingredient vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'recipe' AS word, 'cĂ´ng thá»©c' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how recipe relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a recipe vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'cuisine' AS word, 'áº©m thá»±c' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how cuisine relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a cuisine vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'protein' AS word, 'cháº¥t Ä‘áº¡m' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how protein relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a protein vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'carbohydrate' AS word, 'tinh bá»™t' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how carbohydrate relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a carbohydrate vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'vitamin' AS word, 'vitamin' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how vitamin relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a vitamin vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'mineral' AS word, 'khoĂ¡ng cháº¥t' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how mineral relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a mineral vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'portion' AS word, 'kháº©u pháº§n' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how portion relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a portion vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'beverage' AS word, 'Ä‘á»“ uá»‘ng' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how beverage relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a beverage vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'food chain' AS word, 'chuá»—i thá»©c Äƒn' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how food chain relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a food chain vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'farming' AS word, 'canh tĂ¡c' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how farming relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a farming vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'dairy' AS word, 'sáº£n pháº©m sá»¯a' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how dairy relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a dairy vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'grain' AS word, 'ngÅ© cá»‘c' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how grain relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a grain vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'livelihood' AS word, 'sinh káº¿' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how livelihood relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a livelihood vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'preservative' AS word, 'cháº¥t báº£o quáº£n' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how preservative relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a preservative vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'processed food' AS word, 'thá»±c pháº©m cháº¿ biáº¿n' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how processed food relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a processed food vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'food safety' AS word, 'an toĂ n thá»±c pháº©m' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how food safety relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a food safety vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'seasoning' AS word, 'gia vá»‹' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how seasoning relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a seasoning vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'supply chain' AS word, 'chuá»—i cung á»©ng' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how supply chain relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a supply chain vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'cultivation' AS word, 'gieo trá»“ng' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how cultivation relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a cultivation vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'yield' AS word, 'nÄƒng suáº¥t' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how yield relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a yield vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'hunger' AS word, 'náº¡n Ä‘Ă³i' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how hunger relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a hunger vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
) terms
WHERE topic.id=11
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'government' AS word, 'chĂ­nh phá»§' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how government relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a government vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'policy' AS word, 'chĂ­nh sĂ¡ch' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how policy relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a policy vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'public service' AS word, 'dá»‹ch vá»¥ cĂ´ng' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how public service relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a public service vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'legislation' AS word, 'phĂ¡p cháº¿' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how legislation relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a legislation vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'regulation' AS word, 'quy Ä‘á»‹nh' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how regulation relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a regulation vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'authority' AS word, 'cÆ¡ quan cĂ³ tháº©m quyá»n' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how authority relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a authority vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'administration' AS word, 'chĂ­nh quyá»n' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how administration relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a administration vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'municipality' AS word, 'Ä‘Ă´ thá»‹' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how municipality relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a municipality vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'budget' AS word, 'ngĂ¢n sĂ¡ch' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how budget relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a budget vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'taxpayer' AS word, 'ngÆ°á»i ná»™p thuáº¿' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how taxpayer relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a taxpayer vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'election' AS word, 'báº§u cá»­' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how election relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a election vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'candidate' AS word, 'á»©ng viĂªn' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how candidate relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a candidate vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'parliament' AS word, 'nghá»‹ viá»‡n' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how parliament relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a parliament vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'ministry' AS word, 'bá»™' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how ministry relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a ministry vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'council' AS word, 'há»™i Ä‘á»“ng' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how council relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a council vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'infrastructure' AS word, 'háº¡ táº§ng' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how infrastructure relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a infrastructure vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'civil servant' AS word, 'cĂ´ng chá»©c' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how civil servant relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a civil servant vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'public transport' AS word, 'giao thĂ´ng cĂ´ng cá»™ng' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how public transport relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a public transport vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'healthcare system' AS word, 'há»‡ thá»‘ng y táº¿' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how healthcare system relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a healthcare system vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'social security' AS word, 'an sinh xĂ£ há»™i' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how social security relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a social security vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'transparency' AS word, 'minh báº¡ch' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how transparency relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a transparency vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'accountability' AS word, 'trĂ¡ch nhiá»‡m giáº£i trĂ¬nh' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how accountability relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a accountability vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'permit' AS word, 'giáº¥y phĂ©p' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how permit relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a permit vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'registration' AS word, 'Ä‘Äƒng kĂ½' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how registration relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a registration vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'citizenship' AS word, 'quá»‘c tá»‹ch' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how citizenship relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a citizenship vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'public sector' AS word, 'khu vá»±c cĂ´ng' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how public sector relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a public sector vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'governance' AS word, 'quáº£n trá»‹' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how governance relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a governance vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'census' AS word, 'Ä‘iá»u tra dĂ¢n sá»‘' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how census relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a census vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'subsidy' AS word, 'trá»£ cáº¥p' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how subsidy relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a subsidy vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'law enforcement' AS word, 'thá»±c thi phĂ¡p luáº­t' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how law enforcement relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a law enforcement vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
) terms
WHERE topic.id=12
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'economy' AS word, 'ná»n kinh táº¿' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how economy relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a economy vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'finance' AS word, 'tĂ i chĂ­nh' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how finance relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a finance vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'investment' AS word, 'Ä‘áº§u tÆ°' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how investment relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a investment vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'inflation' AS word, 'láº¡m phĂ¡t' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how inflation relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a inflation vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'interest rate' AS word, 'lĂ£i suáº¥t' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how interest rate relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a interest rate vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'currency' AS word, 'tiá»n tá»‡' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how currency relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a currency vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'exchange rate' AS word, 'tá»· giĂ¡' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how exchange rate relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a exchange rate vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'revenue' AS word, 'doanh thu' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how revenue relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a revenue vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'profit' AS word, 'lá»£i nhuáº­n' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how profit relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a profit vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'debt' AS word, 'ná»£' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how debt relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a debt vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'loan' AS word, 'khoáº£n vay' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how loan relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a loan vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'credit' AS word, 'tĂ­n dá»¥ng' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how credit relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a credit vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'bankruptcy' AS word, 'phĂ¡ sáº£n' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how bankruptcy relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a bankruptcy vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'recession' AS word, 'suy thoĂ¡i' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how recession relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a recession vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'growth' AS word, 'tÄƒng trÆ°á»Ÿng' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how growth relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a growth vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'market' AS word, 'thá»‹ trÆ°á»ng' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how market relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a market vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'stock' AS word, 'cá»• phiáº¿u' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how stock relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a stock vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'shareholder' AS word, 'cá»• Ä‘Ă´ng' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how shareholder relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a shareholder vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'budget' AS word, 'ngĂ¢n sĂ¡ch' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how budget relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a budget vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'tax' AS word, 'thuáº¿' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how tax relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a tax vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'trade' AS word, 'thÆ°Æ¡ng máº¡i' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how trade relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a trade vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'export' AS word, 'xuáº¥t kháº©u' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how export relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a export vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'import' AS word, 'nháº­p kháº©u' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how import relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a import vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'subsidy' AS word, 'trá»£ cáº¥p' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how subsidy relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a subsidy vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'wealth' AS word, 'sá»± giĂ u cĂ³' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how wealth relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a wealth vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'income' AS word, 'thu nháº­p' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how income relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a income vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'expenditure' AS word, 'chi tiĂªu' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how expenditure relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a expenditure vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'saving' AS word, 'tiá»n tiáº¿t kiá»‡m' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how saving relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a saving vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'capital' AS word, 'vá»‘n' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how capital relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a capital vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'forecast' AS word, 'dá»± bĂ¡o' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how forecast relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a forecast vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
) terms
WHERE topic.id=13
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'science' AS word, 'khoa há»c' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how science relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a science vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'research' AS word, 'nghiĂªn cá»©u' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how research relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a research vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'experiment' AS word, 'thĂ­ nghiá»‡m' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how experiment relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a experiment vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'hypothesis' AS word, 'giáº£ thuyáº¿t' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how hypothesis relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a hypothesis vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'methodology' AS word, 'phÆ°Æ¡ng phĂ¡p luáº­n' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how methodology relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a methodology vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'analysis' AS word, 'phĂ¢n tĂ­ch' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how analysis relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a analysis vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'evidence' AS word, 'báº±ng chá»©ng' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how evidence relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a evidence vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'observation' AS word, 'quan sĂ¡t' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how observation relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a observation vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'theory' AS word, 'lĂ½ thuyáº¿t' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how theory relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a theory vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'laboratory' AS word, 'phĂ²ng thĂ­ nghiá»‡m' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how laboratory relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a laboratory vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'data' AS word, 'dá»¯ liá»‡u' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how data relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a data vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'sample' AS word, 'máº«u' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how sample relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a sample vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'variable' AS word, 'biáº¿n sá»‘' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how variable relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a variable vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'discovery' AS word, 'phĂ¡t hiá»‡n' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how discovery relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a discovery vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'innovation' AS word, 'Ä‘á»•i má»›i' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how innovation relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a innovation vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'scientist' AS word, 'nhĂ  khoa há»c' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how scientist relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a scientist vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'peer review' AS word, 'Ä‘Ă¡nh giĂ¡ Ä‘á»“ng cáº¥p' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how peer review relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a peer review vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'publication' AS word, 'cĂ´ng bá»‘' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how publication relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a publication vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'finding' AS word, 'káº¿t quáº£ nghiĂªn cá»©u' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how finding relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a finding vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'accuracy' AS word, 'Ä‘á»™ chĂ­nh xĂ¡c' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how accuracy relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a accuracy vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'reliability' AS word, 'Ä‘á»™ tin cáº­y' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how reliability relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a reliability vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'measurement' AS word, 'Ä‘o lÆ°á»ng' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how measurement relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a measurement vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'trial' AS word, 'thá»­ nghiá»‡m' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how trial relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a trial vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'conclusion' AS word, 'káº¿t luáº­n' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how conclusion relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a conclusion vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'researcher' AS word, 'nhĂ  nghiĂªn cá»©u' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how researcher relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a researcher vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'procedure' AS word, 'quy trĂ¬nh' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how procedure relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a procedure vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'comparison' AS word, 'so sĂ¡nh' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how comparison relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a comparison vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'statistics' AS word, 'thá»‘ng kĂª' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how statistics relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a statistics vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'equipment' AS word, 'thiáº¿t bá»‹' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how equipment relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a equipment vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'breakthrough' AS word, 'bÆ°á»›c Ä‘á»™t phĂ¡' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how breakthrough relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a breakthrough vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
) terms
WHERE topic.id=14
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'crime' AS word, 'tá»™i pháº¡m' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how crime relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a crime vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'law' AS word, 'phĂ¡p luáº­t' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how law relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a law vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'offence' AS word, 'hĂ nh vi pháº¡m phĂ¡p' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how offence relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a offence vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'defendant' AS word, 'bá»‹ cĂ¡o' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how defendant relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a defendant vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'prosecution' AS word, 'bĂªn cĂ´ng tá»‘' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how prosecution relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a prosecution vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'verdict' AS word, 'phĂ¡n quyáº¿t' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how verdict relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a verdict vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'sentence' AS word, 'báº£n Ă¡n' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how sentence relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a sentence vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'trial' AS word, 'phiĂªn tĂ²a' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how trial relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a trial vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'jury' AS word, 'bá»“i tháº©m Ä‘oĂ n' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how jury relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a jury vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'witness' AS word, 'nhĂ¢n chá»©ng' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how witness relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a witness vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'evidence' AS word, 'báº±ng chá»©ng' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how evidence relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a evidence vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'suspect' AS word, 'nghi pháº¡m' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how suspect relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a suspect vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'investigation' AS word, 'Ä‘iá»u tra' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how investigation relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a investigation vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'arrest' AS word, 'báº¯t giá»¯' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how arrest relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a arrest vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'custody' AS word, 'giam giá»¯' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how custody relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a custody vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'fine' AS word, 'tiá»n pháº¡t' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how fine relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a fine vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'penalty' AS word, 'hĂ¬nh pháº¡t' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how penalty relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a penalty vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'appeal' AS word, 'khĂ¡ng cĂ¡o' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how appeal relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a appeal vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'legislation' AS word, 'phĂ¡p cháº¿' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how legislation relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a legislation vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'contract' AS word, 'há»£p Ä‘á»“ng' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how contract relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a contract vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'fraud' AS word, 'gian láº­n' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how fraud relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a fraud vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'theft' AS word, 'trá»™m cáº¯p' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how theft relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a theft vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'vandalism' AS word, 'phĂ¡ hoáº¡i' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how vandalism relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a vandalism vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'victim' AS word, 'náº¡n nhĂ¢n' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how victim relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a victim vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'lawyer' AS word, 'luáº­t sÆ°' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how lawyer relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a lawyer vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'judge' AS word, 'tháº©m phĂ¡n' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how judge relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a judge vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'court' AS word, 'tĂ²a Ă¡n' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how court relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a court vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'security' AS word, 'an ninh' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how security relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a security vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'illegal' AS word, 'báº¥t há»£p phĂ¡p' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how illegal relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a illegal vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'deterrent' AS word, 'biá»‡n phĂ¡p rÄƒn Ä‘e' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how deterrent relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a deterrent vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
) terms
WHERE topic.id=15
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'globalization' AS word, 'toĂ n cáº§u hĂ³a' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how globalization relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a globalization vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'integration' AS word, 'há»™i nháº­p' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how integration relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a integration vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'interdependence' AS word, 'phá»¥ thuá»™c láº«n nhau' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how interdependence relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a interdependence vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'multinational' AS word, 'Ä‘a quá»‘c gia' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how multinational relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a multinational vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'international trade' AS word, 'thÆ°Æ¡ng máº¡i quá»‘c táº¿' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how international trade relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a international trade vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'outsourcing' AS word, 'thuĂª ngoĂ i' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how outsourcing relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a outsourcing vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'migration' AS word, 'di cÆ°' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how migration relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a migration vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'cooperation' AS word, 'há»£p tĂ¡c' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how cooperation relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a cooperation vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'diplomacy' AS word, 'ngoáº¡i giao' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how diplomacy relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a diplomacy vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'diversity' AS word, 'Ä‘a dáº¡ng' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how diversity relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a diversity vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'treaty' AS word, 'hiá»‡p Æ°á»›c' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how treaty relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a treaty vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'alliance' AS word, 'liĂªn minh' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how alliance relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a alliance vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'economic union' AS word, 'liĂªn minh kinh táº¿' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how economic union relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a economic union vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'supply chain' AS word, 'chuá»—i cung á»©ng' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how supply chain relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a supply chain vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'cultural exchange' AS word, 'trao Ä‘á»•i vÄƒn hĂ³a' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how cultural exchange relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a cultural exchange vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'standardization' AS word, 'tiĂªu chuáº©n hĂ³a' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how standardization relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a standardization vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'competition' AS word, 'cáº¡nh tranh' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how competition relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a competition vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'connectivity' AS word, 'káº¿t ná»‘i' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how connectivity relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a connectivity vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'import' AS word, 'nháº­p kháº©u' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how import relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a import vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'export' AS word, 'xuáº¥t kháº©u' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how export relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a export vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'investment' AS word, 'Ä‘áº§u tÆ°' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how investment relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a investment vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'global market' AS word, 'thá»‹ trÆ°á»ng toĂ n cáº§u' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how global market relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a global market vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'outsourced work' AS word, 'cĂ´ng viá»‡c thuĂª ngoĂ i' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how outsourced work relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a outsourced work vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'expansion' AS word, 'má»Ÿ rá»™ng' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how expansion relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a expansion vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'border' AS word, 'biĂªn giá»›i' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how border relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a border vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'tariff' AS word, 'thuáº¿ quan' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how tariff relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a tariff vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'localization' AS word, 'báº£n Ä‘á»‹a hĂ³a' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how localization relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a localization vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'mobility' AS word, 'kháº£ nÄƒng dá»‹ch chuyá»ƒn' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how mobility relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a mobility vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'remittance' AS word, 'kiá»u há»‘i' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how remittance relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a remittance vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'inequality' AS word, 'báº¥t bĂ¬nh Ä‘áº³ng' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how inequality relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a inequality vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
) terms
WHERE topic.id=16
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'urbanization' AS word, 'Ä‘Ă´ thá»‹ hĂ³a' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how urbanization relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a urbanization vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'housing' AS word, 'nhĂ  á»Ÿ' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how housing relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a housing vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'city planning' AS word, 'quy hoáº¡ch thĂ nh phá»‘' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how city planning relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a city planning vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'infrastructure' AS word, 'háº¡ táº§ng' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how infrastructure relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a infrastructure vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'residential' AS word, 'khu dĂ¢n cÆ°' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how residential relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a residential vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'accommodation' AS word, 'chá»— á»Ÿ' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how accommodation relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a accommodation vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'mortgage' AS word, 'khoáº£n tháº¿ cháº¥p' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how mortgage relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a mortgage vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'tenant' AS word, 'ngÆ°á»i thuĂª nhĂ' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how tenant relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a tenant vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'landlord' AS word, 'chá»§ nhĂ' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how landlord relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a landlord vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'rent' AS word, 'tiá»n thuĂª' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how rent relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a rent vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'suburb' AS word, 'ngoáº¡i Ă´' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how suburb relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a suburb vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'city center' AS word, 'trung tĂ¢m thĂ nh phá»‘' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how city center relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a city center vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'commute' AS word, 'Ä‘i láº¡i hĂ ng ngĂ y' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how commute relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a commute vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'population density' AS word, 'máº­t Ä‘á»™ dĂ¢n sá»‘' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how population density relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a population density vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'congestion' AS word, 'Ă¹n táº¯c' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how congestion relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a congestion vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'public transport' AS word, 'giao thĂ´ng cĂ´ng cá»™ng' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how public transport relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a public transport vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'skyscraper' AS word, 'nhĂ  chá»c trá»i' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how skyscraper relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a skyscraper vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'renovation' AS word, 'cáº£i táº¡o' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how renovation relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a renovation vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'zoning' AS word, 'phĂ¢n khu' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how zoning relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a zoning vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'affordable housing' AS word, 'nhĂ  á»Ÿ giĂ¡ pháº£i chÄƒng' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how affordable housing relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a affordable housing vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'construction' AS word, 'xĂ¢y dá»±ng' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how construction relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a construction vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'property' AS word, 'báº¥t Ä‘á»™ng sáº£n' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how property relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a property vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'neighborhood' AS word, 'khu phá»‘' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how neighborhood relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a neighborhood vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'amenity' AS word, 'tiá»‡n Ă­ch' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how amenity relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a amenity vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'slum' AS word, 'khu á»• chuá»™t' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how slum relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a slum vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'urban sprawl' AS word, 'Ä‘Ă´ thá»‹ lan rá»™ng' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how urban sprawl relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a urban sprawl vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'sustainable city' AS word, 'thĂ nh phá»‘ bá»n vá»¯ng' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how sustainable city relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a sustainable city vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'green space' AS word, 'khĂ´ng gian xanh' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how green space relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a green space vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'utilities' AS word, 'tiá»‡n Ă­ch cĂ´ng cá»™ng' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how utilities relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a utilities vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'development' AS word, 'phĂ¡t triá»ƒn' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how development relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a development vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
) terms
WHERE topic.id=17
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'family' AS word, 'gia Ä‘Ă¬nh' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how family relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a family vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'relationship' AS word, 'má»‘i quan há»‡' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how relationship relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a relationship vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'generation' AS word, 'tháº¿ há»‡' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how generation relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a generation vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'relative' AS word, 'há» hĂ ng' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how relative relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a relative vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'household' AS word, 'há»™ gia Ä‘Ă¬nh' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how household relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a household vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'sibling' AS word, 'anh chá»‹ em' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how sibling relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a sibling vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'parenting' AS word, 'nuĂ´i dáº¡y con' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how parenting relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a parenting vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'upbringing' AS word, 'cĂ¡ch nuĂ´i dÆ°á»¡ng' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how upbringing relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a upbringing vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'bond' AS word, 'má»‘i gáº¯n bĂ³' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how bond relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a bond vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'responsibility' AS word, 'trĂ¡ch nhiá»‡m' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how responsibility relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a responsibility vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'support' AS word, 'sá»± há»— trá»£' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how support relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a support vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'conflict' AS word, 'xung Ä‘á»™t' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how conflict relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a conflict vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'compromise' AS word, 'thá»a hiá»‡p' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how compromise relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a compromise vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'communication' AS word, 'giao tiáº¿p' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how communication relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a communication vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'marriage' AS word, 'hĂ´n nhĂ¢n' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how marriage relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a marriage vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'divorce' AS word, 'ly hĂ´n' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how divorce relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a divorce vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'adoption' AS word, 'nháº­n nuĂ´i' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how adoption relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a adoption vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'single parent' AS word, 'cha máº¹ Ä‘Æ¡n thĂ¢n' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how single parent relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a single parent vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'elderly' AS word, 'ngÆ°á»i cao tuá»•i' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how elderly relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a elderly vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'childcare' AS word, 'chÄƒm sĂ³c tráº»' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how childcare relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a childcare vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'inheritance' AS word, 'thá»«a káº¿' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how inheritance relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a inheritance vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'cooperation' AS word, 'há»£p tĂ¡c' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how cooperation relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a cooperation vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'loyalty' AS word, 'sá»± trung thĂ nh' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how loyalty relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a loyalty vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'trust' AS word, 'niá»m tin' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how trust relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a trust vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'friendship' AS word, 'tĂ¬nh báº¡n' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how friendship relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a friendship vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'partner' AS word, 'báº¡n Ä‘á»i' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how partner relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a partner vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'engagement' AS word, 'Ä‘Ă­nh hĂ´n' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how engagement relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a engagement vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'commitment' AS word, 'cam káº¿t' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how commitment relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a commitment vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'dependence' AS word, 'sá»± phá»¥ thuá»™c' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how dependence relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a dependence vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'reconciliation' AS word, 'hĂ²a giáº£i' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how reconciliation relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a reconciliation vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
) terms
WHERE topic.id=18
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'sports' AS word, 'thá»ƒ thao' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how sports relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a sports vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'recreation' AS word, 'giáº£i trĂ­' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how recreation relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a recreation vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'competition' AS word, 'cuá»™c thi Ä‘áº¥u' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how competition relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a competition vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'tournament' AS word, 'giáº£i Ä‘áº¥u' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how tournament relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a tournament vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'athlete' AS word, 'váº­n Ä‘á»™ng viĂªn' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how athlete relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a athlete vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'coach' AS word, 'huáº¥n luyá»‡n viĂªn' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how coach relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a coach vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'training' AS word, 'táº­p luyá»‡n' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how training relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a training vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'fitness' AS word, 'thá»ƒ lá»±c' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how fitness relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a fitness vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'stamina' AS word, 'sá»©c bá»n' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how stamina relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a stamina vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'strength' AS word, 'sá»©c máº¡nh' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how strength relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a strength vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'teamwork' AS word, 'lĂ m viá»‡c nhĂ³m' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how teamwork relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a teamwork vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'opponent' AS word, 'Ä‘á»‘i thá»§' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how opponent relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a opponent vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'referee' AS word, 'trá»ng tĂ i' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how referee relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a referee vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'score' AS word, 'Ä‘iá»ƒm sá»‘' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how score relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a score vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'victory' AS word, 'chiáº¿n tháº¯ng' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how victory relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a victory vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'defeat' AS word, 'tháº¥t báº¡i' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how defeat relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a defeat vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'league' AS word, 'giáº£i Ä‘áº¥u' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how league relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a league vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'facility' AS word, 'cÆ¡ sá»Ÿ thá»ƒ thao' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how facility relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a facility vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'equipment' AS word, 'dá»¥ng cá»¥' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how equipment relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a equipment vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'outdoor activity' AS word, 'hoáº¡t Ä‘á»™ng ngoĂ i trá»i' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how outdoor activity relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a outdoor activity vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'hobby' AS word, 'sá»Ÿ thĂ­ch' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how hobby relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a hobby vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'leisure' AS word, 'thá»i gian ráº£nh' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how leisure relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a leisure vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'recovery' AS word, 'phá»¥c há»“i' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how recovery relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a recovery vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'warm-up' AS word, 'khá»Ÿi Ä‘á»™ng' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how warm-up relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a warm-up vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'injury' AS word, 'cháº¥n thÆ°Æ¡ng' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how injury relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a injury vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'stamina training' AS word, 'luyá»‡n sá»©c bá»n' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how stamina training relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a stamina training vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'spectator' AS word, 'khĂ¡n giáº£' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how spectator relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a spectator vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'stadium' AS word, 'sĂ¢n váº­n Ä‘á»™ng' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how stadium relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a stadium vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'championship' AS word, 'giáº£i vĂ´ Ä‘á»‹ch' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how championship relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a championship vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'performance' AS word, 'phong Ä‘á»™' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how performance relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a performance vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'participation' AS word, 'tham gia' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how participation relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a participation vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
) terms
WHERE topic.id=19
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'tourism' AS word, 'du lá»‹ch' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how tourism relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a tourism vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'tourist' AS word, 'khĂ¡ch du lá»‹ch' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how tourist relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a tourist vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'attraction' AS word, 'Ä‘iá»ƒm thu hĂºt' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how attraction relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a attraction vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'destination' AS word, 'Ä‘iá»ƒm Ä‘áº¿n' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how destination relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a destination vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'heritage site' AS word, 'di sáº£n' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how heritage site relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a heritage site vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'accommodation' AS word, 'chá»— á»Ÿ' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how accommodation relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a accommodation vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'itinerary' AS word, 'lá»‹ch trĂ¬nh' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how itinerary relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a itinerary vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'tour guide' AS word, 'hÆ°á»›ng dáº«n viĂªn' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how tour guide relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a tour guide vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'excursion' AS word, 'chuyáº¿n tham quan' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how excursion relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a excursion vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'package tour' AS word, 'tour trá»n gĂ³i' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how package tour relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a package tour vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'souvenir' AS word, 'quĂ  lÆ°u niá»‡m' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how souvenir relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a souvenir vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'hospitality' AS word, 'dá»‹ch vá»¥ Ä‘Ă³n tiáº¿p' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how hospitality relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a hospitality vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'ecotourism' AS word, 'du lá»‹ch sinh thĂ¡i' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how ecotourism relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a ecotourism vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'mass tourism' AS word, 'du lá»‹ch Ä‘áº¡i trĂ' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how mass tourism relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a mass tourism vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'peak season' AS word, 'mĂ¹a cao Ä‘iá»ƒm' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how peak season relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a peak season vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'off-season' AS word, 'mĂ¹a tháº¥p Ä‘iá»ƒm' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how off-season relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a off-season vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'booking' AS word, 'Ä‘áº·t chá»—' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how booking relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a booking vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'visa' AS word, 'thá»‹ thá»±c' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how visa relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a visa vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'currency exchange' AS word, 'Ä‘á»•i tiá»n' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how currency exchange relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a currency exchange vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'sightseeing' AS word, 'tham quan' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how sightseeing relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a sightseeing vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'landmark' AS word, 'Ä‘á»‹a danh' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how landmark relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a landmark vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'resort' AS word, 'khu nghá»‰ dÆ°á»¡ng' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how resort relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a resort vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'homestay' AS word, 'chá»— á»Ÿ nhĂ  dĂ¢n' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how homestay relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a homestay vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'local culture' AS word, 'vÄƒn hĂ³a Ä‘á»‹a phÆ°Æ¡ng' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how local culture relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a local culture vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'revenue' AS word, 'doanh thu' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how revenue relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a revenue vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'accessibility' AS word, 'kháº£ nÄƒng tiáº¿p cáº­n' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how accessibility relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a accessibility vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'preservation' AS word, 'báº£o tá»“n' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how preservation relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a preservation vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'sustainable tourism' AS word, 'du lá»‹ch bá»n vá»¯ng' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how sustainable tourism relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a sustainable tourism vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'cruise' AS word, 'du thuyá»n' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how cruise relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a cruise vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'backpacking' AS word, 'du lá»‹ch ba lĂ´' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how backpacking relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a backpacking vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
) terms
WHERE topic.id=20
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'energy' AS word, 'nÄƒng lÆ°á»£ng' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how energy relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a energy vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'natural resource' AS word, 'tĂ i nguyĂªn thiĂªn nhiĂªn' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how natural resource relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a natural resource vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'renewable energy' AS word, 'nÄƒng lÆ°á»£ng tĂ¡i táº¡o' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how renewable energy relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a renewable energy vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'solar power' AS word, 'nÄƒng lÆ°á»£ng máº·t trá»i' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how solar power relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a solar power vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'wind power' AS word, 'nÄƒng lÆ°á»£ng giĂ³' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how wind power relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a wind power vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'hydroelectricity' AS word, 'thá»§y Ä‘iá»‡n' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how hydroelectricity relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a hydroelectricity vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'fossil fuel' AS word, 'nhiĂªn liá»‡u hĂ³a tháº¡ch' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how fossil fuel relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a fossil fuel vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'coal' AS word, 'than Ä‘Ă¡' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how coal relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a coal vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'oil' AS word, 'dáº§u' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how oil relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a oil vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'gas' AS word, 'khĂ­ Ä‘á»‘t' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how gas relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a gas vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'nuclear power' AS word, 'nÄƒng lÆ°á»£ng háº¡t nhĂ¢n' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how nuclear power relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a nuclear power vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'conservation' AS word, 'báº£o tá»“n' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how conservation relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a conservation vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'consumption' AS word, 'tiĂªu thá»¥' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how consumption relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a consumption vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'efficiency' AS word, 'hiá»‡u suáº¥t' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how efficiency relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a efficiency vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'grid' AS word, 'lÆ°á»›i Ä‘iá»‡n' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how grid relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a grid vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'generator' AS word, 'mĂ¡y phĂ¡t Ä‘iá»‡n' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how generator relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a generator vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'emission' AS word, 'khĂ­ tháº£i' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how emission relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a emission vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'scarcity' AS word, 'sá»± khan hiáº¿m' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how scarcity relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a scarcity vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'extraction' AS word, 'khai thĂ¡c' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how extraction relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a extraction vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'recycling' AS word, 'tĂ¡i cháº¿' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how recycling relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a recycling vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'storage' AS word, 'lÆ°u trá»¯' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how storage relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a storage vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'demand' AS word, 'nhu cáº§u' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how demand relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a demand vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'supply' AS word, 'nguá»“n cung' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how supply relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a supply vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'carbon neutral' AS word, 'trung hĂ²a carbon' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how carbon neutral relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a carbon neutral vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'sustainability' AS word, 'bá»n vá»¯ng' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how sustainability relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a sustainability vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'power plant' AS word, 'nhĂ  mĂ¡y Ä‘iá»‡n' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how power plant relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a power plant vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'insulation' AS word, 'cĂ¡ch nhiá»‡t' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how insulation relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a insulation vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'biofuel' AS word, 'nhiĂªn liá»‡u sinh há»c' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how biofuel relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a biofuel vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'depletion' AS word, 'suy kiá»‡t' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how depletion relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a depletion vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'transition' AS word, 'chuyá»ƒn Ä‘á»•i' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how transition relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a transition vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
) terms
WHERE topic.id=21
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'animal' AS word, 'Ä‘á»™ng váº­t' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how animal relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a animal vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'wildlife' AS word, 'Ä‘á»™ng váº­t hoang dĂ£' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how wildlife relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a wildlife vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'species' AS word, 'loĂ i' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how species relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a species vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'habitat' AS word, 'mĂ´i trÆ°á»ng sá»‘ng' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how habitat relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a habitat vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'predator' AS word, 'Ä‘á»™ng váº­t sÄƒn má»“i' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how predator relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a predator vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'prey' AS word, 'con má»“i' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how prey relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a prey vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'mammal' AS word, 'Ä‘á»™ng váº­t cĂ³ vĂº' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how mammal relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a mammal vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'reptile' AS word, 'bĂ² sĂ¡t' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how reptile relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a reptile vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'amphibian' AS word, 'lÆ°á»¡ng cÆ°' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how amphibian relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a amphibian vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'bird migration' AS word, 'chim di cÆ°' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how bird migration relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a bird migration vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'biodiversity' AS word, 'Ä‘a dáº¡ng sinh há»c' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how biodiversity relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a biodiversity vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'extinction' AS word, 'tuyá»‡t chá»§ng' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how extinction relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a extinction vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'endangered' AS word, 'bá»‹ Ä‘e dá»a' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how endangered relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a endangered vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'conservation' AS word, 'báº£o tá»“n' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how conservation relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a conservation vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'ecosystem' AS word, 'há»‡ sinh thĂ¡i' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how ecosystem relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a ecosystem vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'sanctuary' AS word, 'khu báº£o tá»“n' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how sanctuary relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a sanctuary vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'poaching' AS word, 'sÄƒn trá»™m' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how poaching relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a poaching vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'habitat loss' AS word, 'máº¥t mĂ´i trÆ°á»ng sá»‘ng' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how habitat loss relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a habitat loss vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'domestication' AS word, 'thuáº§n hĂ³a' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how domestication relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a domestication vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'breeding' AS word, 'nhĂ¢n giá»‘ng' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how breeding relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a breeding vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'veterinary' AS word, 'thĂº y' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how veterinary relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a veterinary vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'instinct' AS word, 'báº£n nÄƒng' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how instinct relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a instinct vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'herd' AS word, 'báº§y Ä‘Ă n' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how herd relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a herd vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'predation' AS word, 'sá»± sÄƒn má»“i' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how predation relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a predation vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'adaptation' AS word, 'thĂ­ch nghi' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how adaptation relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a adaptation vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'food chain' AS word, 'chuá»—i thá»©c Äƒn' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how food chain relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a food chain vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'marine life' AS word, 'sinh váº­t biá»ƒn' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how marine life relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a marine life vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'population' AS word, 'quáº§n thá»ƒ' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how population relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a population vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'migration' AS word, 'di trĂº' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how migration relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a migration vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'welfare' AS word, 'phĂºc lá»£i Ä‘á»™ng váº­t' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how welfare relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a welfare vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
) terms
WHERE topic.id=22
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'art' AS word, 'nghá»‡ thuáº­t' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how art relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a art vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'architecture' AS word, 'kiáº¿n trĂºc' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how architecture relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a architecture vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'design' AS word, 'thiáº¿t káº¿' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how design relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a design vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'gallery' AS word, 'phĂ²ng triá»ƒn lĂ£m' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how gallery relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a gallery vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'exhibition' AS word, 'triá»ƒn lĂ£m' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how exhibition relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a exhibition vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'sculpture' AS word, 'Ä‘iĂªu kháº¯c' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how sculpture relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a sculpture vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'painting' AS word, 'há»™i há»a' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how painting relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a painting vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'portrait' AS word, 'chĂ¢n dung' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how portrait relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a portrait vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'landscape' AS word, 'phong cáº£nh' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how landscape relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a landscape vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'abstract art' AS word, 'nghá»‡ thuáº­t trá»«u tÆ°á»£ng' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how abstract art relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a abstract art vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'heritage' AS word, 'di sáº£n' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how heritage relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a heritage vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'monument' AS word, 'cĂ´ng trĂ¬nh tÆ°á»Ÿng niá»‡m' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how monument relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a monument vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'facade' AS word, 'máº·t tiá»n' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how facade relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a facade vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'structure' AS word, 'káº¿t cáº¥u' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how structure relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a structure vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'blueprint' AS word, 'báº£n váº½' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how blueprint relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a blueprint vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'renovation' AS word, 'cáº£i táº¡o' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how renovation relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a renovation vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'construction' AS word, 'xĂ¢y dá»±ng' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how construction relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a construction vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'aesthetic' AS word, 'tháº©m má»¹' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how aesthetic relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a aesthetic vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'composition' AS word, 'bá»‘ cá»¥c' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how composition relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a composition vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'proportion' AS word, 'tá»· lá»‡' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how proportion relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a proportion vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'style' AS word, 'phong cĂ¡ch' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how style relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a style vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'modernism' AS word, 'chá»§ nghÄ©a hiá»‡n Ä‘áº¡i' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how modernism relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a modernism vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'craftsmanship' AS word, 'tay nghá» thá»§ cĂ´ng' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how craftsmanship relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a craftsmanship vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'landmark' AS word, 'cĂ´ng trĂ¬nh biá»ƒu tÆ°á»£ng' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how landmark relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a landmark vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'museum' AS word, 'báº£o tĂ ng' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how museum relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a museum vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'installation' AS word, 'tĂ¡c pháº©m sáº¯p Ä‘áº·t' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how installation relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a installation vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'commission' AS word, 'Ä‘áº·t lĂ m tĂ¡c pháº©m' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how commission relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a commission vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'restoration' AS word, 'phá»¥c há»“i' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how restoration relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a restoration vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'spatial' AS word, 'khĂ´ng gian' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how spatial relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a spatial vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'material' AS word, 'váº­t liá»‡u' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how material relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a material vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
) terms
WHERE topic.id=23
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'language' AS word, 'ngĂ´n ngá»¯' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how language relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a language vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'linguistics' AS word, 'ngĂ´n ngá»¯ há»c' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how linguistics relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a linguistics vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'vocabulary' AS word, 'tá»« vá»±ng' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how vocabulary relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a vocabulary vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'grammar' AS word, 'ngá»¯ phĂ¡p' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how grammar relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a grammar vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'pronunciation' AS word, 'phĂ¡t Ă¢m' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how pronunciation relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a pronunciation vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'fluency' AS word, 'sá»± lÆ°u loĂ¡t' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how fluency relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a fluency vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'accent' AS word, 'giá»ng' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how accent relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a accent vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'dialect' AS word, 'phÆ°Æ¡ng ngá»¯' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how dialect relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a dialect vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'bilingual' AS word, 'song ngá»¯' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how bilingual relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a bilingual vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'multilingual' AS word, 'Ä‘a ngá»¯' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how multilingual relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a multilingual vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'translation' AS word, 'dá»‹ch thuáº­t' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how translation relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a translation vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'interpretation' AS word, 'phiĂªn dá»‹ch' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how interpretation relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a interpretation vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'syntax' AS word, 'cĂº phĂ¡p' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how syntax relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a syntax vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'semantics' AS word, 'ngá»¯ nghÄ©a' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how semantics relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a semantics vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'phonetics' AS word, 'ngá»¯ Ă¢m há»c' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how phonetics relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a phonetics vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'morphology' AS word, 'hĂ¬nh thĂ¡i há»c' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how morphology relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a morphology vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'register' AS word, 'phong cĂ¡ch ngĂ´n ngá»¯' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how register relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a register vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'idiom' AS word, 'thĂ nh ngá»¯' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how idiom relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a idiom vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'collocation' AS word, 'káº¿t há»£p tá»«' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how collocation relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a collocation vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'slang' AS word, 'tiáº¿ng lĂ³ng' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how slang relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a slang vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'communication' AS word, 'giao tiáº¿p' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how communication relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a communication vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'comprehension' AS word, 'sá»± hiá»ƒu' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how comprehension relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a comprehension vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'literacy' AS word, 'Ä‘á»c viáº¿t' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how literacy relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a literacy vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'mother tongue' AS word, 'tiáº¿ng máº¹ Ä‘áº»' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how mother tongue relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a mother tongue vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'second language' AS word, 'ngĂ´n ngá»¯ thá»© hai' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how second language relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a second language vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'loanword' AS word, 'tá»« vay mÆ°á»£n' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how loanword relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a loanword vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'meaning' AS word, 'nghÄ©a' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how meaning relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a meaning vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'context' AS word, 'ngá»¯ cáº£nh' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how context relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a context vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'expression' AS word, 'cĂ¡ch diá»…n Ä‘áº¡t' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how expression relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a expression vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'linguist' AS word, 'nhĂ  ngĂ´n ngá»¯ há»c' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how linguist relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a linguist vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
) terms
WHERE topic.id=24
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'climate change' AS word, 'biáº¿n Ä‘á»•i khĂ­ háº­u' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how climate change relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a climate change vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'global warming' AS word, 'nĂ³ng lĂªn toĂ n cáº§u' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how global warming relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a global warming vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'greenhouse effect' AS word, 'hiá»‡u á»©ng nhĂ  kĂ­nh' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how greenhouse effect relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a greenhouse effect vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'carbon dioxide' AS word, 'khĂ­ carbon dioxide' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how carbon dioxide relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a carbon dioxide vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'emission' AS word, 'khĂ­ tháº£i' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how emission relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a emission vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'mitigation' AS word, 'giáº£m thiá»ƒu' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how mitigation relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a mitigation vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'adaptation' AS word, 'thĂ­ch á»©ng' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how adaptation relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a adaptation vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'temperature rise' AS word, 'tÄƒng nhiá»‡t Ä‘á»™' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how temperature rise relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a temperature rise vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'sea level' AS word, 'má»±c nÆ°á»›c biá»ƒn' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how sea level relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a sea level vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'extreme weather' AS word, 'thá»i tiáº¿t cá»±c Ä‘oan' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how extreme weather relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a extreme weather vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'drought' AS word, 'háº¡n hĂ¡n' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how drought relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a drought vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'wildfire' AS word, 'chĂ¡y rá»«ng' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how wildfire relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a wildfire vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'flood' AS word, 'lá»¥t' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how flood relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a flood vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'storm' AS word, 'bĂ£o' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how storm relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a storm vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'resilience' AS word, 'kháº£ nÄƒng chá»‘ng chá»‹u' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how resilience relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a resilience vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'vulnerability' AS word, 'tĂ­nh dá»… tá»•n thÆ°Æ¡ng' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how vulnerability relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a vulnerability vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'carbon footprint' AS word, 'dáº¥u chĂ¢n carbon' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how carbon footprint relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a carbon footprint vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'renewable energy' AS word, 'nÄƒng lÆ°á»£ng tĂ¡i táº¡o' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how renewable energy relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a renewable energy vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'decarbonization' AS word, 'giáº£m carbon hĂ³a' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how decarbonization relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a decarbonization vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'fossil fuel' AS word, 'nhiĂªn liá»‡u hĂ³a tháº¡ch' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how fossil fuel relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a fossil fuel vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'net zero' AS word, 'phĂ¡t tháº£i rĂ²ng báº±ng khĂ´ng' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how net zero relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a net zero vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'climate policy' AS word, 'chĂ­nh sĂ¡ch khĂ­ háº­u' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how climate policy relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a climate policy vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'carbon capture' AS word, 'thu giá»¯ carbon' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how carbon capture relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a carbon capture vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'deforestation' AS word, 'phĂ¡ rá»«ng' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how deforestation relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a deforestation vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'heatwave' AS word, 'Ä‘á»£t náº¯ng nĂ³ng' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how heatwave relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a heatwave vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'glacier' AS word, 'sĂ´ng bÄƒng' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how glacier relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a glacier vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'biodiversity loss' AS word, 'máº¥t Ä‘a dáº¡ng sinh há»c' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how biodiversity loss relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a biodiversity loss vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'environmental impact' AS word, 'tĂ¡c Ä‘á»™ng mĂ´i trÆ°á»ng' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how environmental impact relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a environmental impact vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'sustainable' AS word, 'bá»n vá»¯ng' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how sustainable relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a sustainable vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'ecosystem' AS word, 'há»‡ sinh thĂ¡i' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how ecosystem relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a ecosystem vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
) terms
WHERE topic.id=25
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
UPDATE vocabulary_lessons
SET target_word_count=CASE sort_order WHEN 1 THEN 10 WHEN 2 THEN 20 ELSE 30 END;

DELETE FROM vocabulary_lesson_terms;

INSERT INTO vocabulary_lesson_terms(lesson_id,term_id,sort_order)
SELECT ranked.lesson_id, ranked.term_id, ranked.term_order
FROM (
  SELECT l.id AS lesson_id, t.id AS term_id,
         ROW_NUMBER() OVER (PARTITION BY l.id ORDER BY t.id) AS term_order,
         CASE l.sort_order WHEN 1 THEN 10 WHEN 2 THEN 20 ELSE 30 END AS target_count
  FROM vocabulary_lessons l
  JOIN vocabulary_terms t ON t.topic_id=l.topic_id
) ranked
WHERE ranked.term_order <= ranked.target_count;