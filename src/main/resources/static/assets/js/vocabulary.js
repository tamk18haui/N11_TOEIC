(function () {
  'use strict';

  function speak(word, audioUrl) {
    if (audioUrl) {
      const audio = new Audio(audioUrl);
      return audio.play().catch(function () {
        if (word) {
          speakWithSpeechSynthesis(word);
          return;
        }
        throw new Error(translate('audioPlaybackFailed'));
      });
    }
    speakWithSpeechSynthesis(word);
    return Promise.resolve();
  }

  function speakWithSpeechSynthesis(word) {
    if (!window.speechSynthesis || !word) return;
    window.speechSynthesis.cancel();
    const utterance = new SpeechSynthesisUtterance(word);
    utterance.lang = 'en-US';
    const voice = window.speechSynthesis.getVoices().find(function (item) {
      return item.lang.toLowerCase() === 'en-us';
    });
    if (voice) utterance.voice = voice;
    window.speechSynthesis.speak(utterance);
  }

  const translations = {
    VI: {
      heroEyebrow: '✧ LỘ TRÌNH TỪ VỰNG TOEIC',
      heroTitleFirst: 'Xây dựng vốn từ vựng,',
      heroTitleSecond: 'từng chủ đề một.',
      heroDescription: 'Khám phá các chủ đề TOEIC, học qua các bài ngắn và theo dõi tiến độ từ từ đầu tiên đến khi thành thạo.',
      heroNote: 'Tiến bộ từng bước. Vốn từ vững chắc. Tự tin trả lời.',
      topicStat: 'Chủ đề học',
      levelStat: 'Chủ đề từ cơ bản đến nâng cao',
      stepsStat: 'Học · luyện tập · thành thạo',
      progressEyebrow: 'TIẾN ĐỘ HỌC TẬP',
      progressHeading: 'Tiếp tục chinh phục lộ trình',
      progressSummary: 'bài học hoàn thành ·',
      viewHistory: 'Xem lịch sử →',
      guestEyebrow: 'HỌC THỬ',
      guestHeading: 'Khám phá các chủ đề trước khi bắt đầu',
      guestDescription: 'Xem danh sách chủ đề và lộ trình. Đăng nhập để học thẻ từ, làm bài và lưu tiến độ.',
      signIn: 'Đăng nhập để đồng bộ tiến độ →',
      curriculumEyebrow: 'CHƯƠNG TRÌNH TOEIC CỦA BẠN',
      topicHeading: 'Chọn chủ đề để bắt đầu',
      topicDescription: 'Học theo chủ đề với thẻ từ, bài luyện và bài kiểm tra.',
      topics: 'chủ đề',
      levelBasic: 'Cơ bản',
      levelIntermediate: 'Trung cấp',
      levelAdvanced: 'Nâng cao',
      lessons: 'bài học',
      complete: 'hoàn thành',
      placementPassedShort: 'Đã đạt bài kiểm tra',
      placementAvailable: 'Có bài kiểm tra tổng hợp',
      openRoadmap: 'Mở lộ trình →',
      emptyTopics: 'Chưa có chủ đề từ vựng',
      emptyTopicsText: 'Các chặng học sẽ xuất hiện tại đây khi nội dung được cập nhật.',
      wordEyebrow: 'MỖI NGÀY MỘT TỪ',
      wordHeading: 'Từ vựng hôm nay',
      wordDescription: 'Ôn nhanh một từ trong kho từ vựng.',
      randomWord: 'TỪ NGẪU NHIÊN',
      exploreTopic: 'Khám phá chủ đề này →',
      wordEmpty: 'Từ vựng sẽ xuất hiện khi có chủ đề được đăng.',
      topicIncludes: 'Mỗi chủ đề bao gồm',
      stepFlashcards: 'Thẻ từ vựng có ví dụ',
      stepPractice: 'Bài tập và nghe viết',
      stepPlacement: 'Bài kiểm tra tổng hợp và tiến độ',
      settings: '⚙ Cài đặt hiển thị',
      theme: 'Giao diện',
      fontSize: 'Cỡ chữ',
      language: 'Ngôn ngữ',
      saveSettings: 'Lưu cài đặt',
      settingsSaved: 'Đã lưu cài đặt.',
      settingsSaveFailed: 'Không thể lưu cài đặt. Vui lòng thử lại.',
      signInPrompt: 'Đăng nhập để lưu tiến độ học tập.',
      wordMastered: 'Đã lưu từ này là đã thuộc.',
      saveWord: 'Lưu từ này',
      savedWord: 'Đã lưu',
      wordSavedNotice: 'Từ vựng đã được lưu vào sổ tay của bạn.',
      flashcardLoadFailed: 'Không tải được thẻ từ tiếp theo.',
      saveWordFailed: 'Không thể lưu từ vựng. Vui lòng thử lại.',
      pronunciationUnavailable: 'Trình duyệt này không hỗ trợ nhận diện giọng nói.',
      noWordAvailable: 'Không có từ vựng để luyện tập.',
      pronunciationGood: 'Phát âm tốt!',
      pronunciationRetry: 'Hãy nghe lại mẫu và thử lần nữa.',
      microphoneUnavailable: 'Không thể truy cập micro. Hãy kiểm tra quyền của trình duyệt.',
      listening: 'Đang nghe…',
      quizScore: 'Bạn trả lời đúng',
      quizQuestions: 'câu.',
      backAllTopics: '← Tất cả chủ đề',
      resultPlacementTitle: 'Kết quả bài kiểm tra tổng hợp',
      resultPracticeTitle: 'Kết quả luyện tập',
      answeredCorrectly: 'Trả lời đúng',
      questions: 'câu',
      placementPassedResult: 'Đạt yêu cầu bài kiểm tra tổng hợp. Bạn có thể học bất kỳ bài nào.',
      placementFailedResult: 'Chưa đạt 25 câu đúng. Bạn có thể ôn tập và làm lại.',
      lessonCompletedResult: 'Bài học đã hoàn thành ·',
      lessonPassHint: 'Đạt 70% để ghi nhận hoàn thành bài học.',
      returnToTopics: 'Quay về',
      viewHistoryLabel: 'Xem lịch sử',
      answerDetails: 'Chi tiết câu trả lời',
      question: 'Câu',
      correct: '✓ Đúng',
      incorrect: '✗ Sai',
      yourAnswer: 'Câu trả lời của bạn:',
      historyHeading: 'Lịch sử luyện tập',
      historyDescription: 'Xem lại các bài kiểm tra từ vựng đã làm',
      viewDetails: 'Xem chi tiết',
      noAttempts: 'Chưa có bài kiểm tra',
      startTopicHint: 'Hãy bắt đầu với một chủ đề từ vựng để luyện tập.',
      chooseTopic: 'Chọn chủ đề',
      adminRole: 'Quản trị viên',
      learnerRole: 'Học viên',
      signInSync: 'Đăng nhập để đồng bộ tiến độ',
      placementTestTitle: 'BÀI KIỂM TRA TỔNG HỢP',
      lessonQuizTitle: 'BÀI KIỂM TRA BÀI HỌC',
      multipleChoice: 'trắc nghiệm',
      dictationLabel: 'nghe viết',
      passAt: 'đạt từ',
      audioUnavailable: 'Chưa có âm thanh cho câu này',
      audioPlaybackFailed: 'Không thể phát âm thanh. Vui lòng thử lại.',
      backRoadmap: '← Quay lại lộ trình',
      backTopic: '← Quay lại chủ đề',
      lessonsCompleted: 'bài học hoàn thành',
      starsEarned: 'số sao đạt được',
      wordsAvailable: 'từ hiện có',
      placementPassed: '✓ Đã đạt bài kiểm tra tổng hợp',
      takePlacement: 'Làm bài kiểm tra tổng hợp (30 câu)',
      signInPlacement: 'Đăng nhập để làm bài kiểm tra tổng hợp',
      placementHint: 'Bài kiểm tra tự đánh giá (đạt từ 25/30). Mọi bài học đều học tự do.',
      learningPath: 'LỘ TRÌNH HỌC',
      lessonsInTopic: 'Bài học trong chủ đề',
      locked: 'Khóa',
      inProgress: 'Đang học',
      completed: 'Hoàn thành',
      open: 'Mở',
      words: 'từ',
      target: 'Mục tiêu',
      openLesson: 'Vào học →',
      lessonsPreparing: 'Bài học đang được chuẩn bị',
      lessonsPreparingText: 'Các bài học của chủ đề này sẽ xuất hiện khi nội dung được xuất bản.',
      learnAtYourPace: 'Học thẻ, làm bài tập và luyện nghe viết.',
      flashcards: 'Học thẻ',
      exercises: 'Bài tập',
      dictation: 'Nghe viết',
      pronunciation: 'Luyện phát âm',
      flashcardPractice: 'LUYỆN TẬP BẰNG THẺ',
      reviewWords: 'Ôn tập từ vựng',
      flipCardHint: 'Nhấn để lật thẻ',
      previous: '← Trước',
      listen: '🔊 Nghe',
      markMastered: 'Đã thuộc',
      next: 'Tiếp →',
      wordsPreparing: 'Từ vựng đang được bổ sung',
      wordsPreparingText: 'Bài học này chưa có từ để luyện tập.',
      speakPractice: 'LUYỆN NÓI',
      pronunciationTitle: 'Luyện phát âm bằng giọng nói',
      pronunciationDescription: 'Nghe từ mẫu, nhấn nút micro và đọc lại. Trình duyệt sẽ so sánh câu nhận diện được.',
      startSpeaking: '🎙 Luyện từ hiện tại',
      placementInstructions: 'Bài kiểm tra gồm 25 câu trắc nghiệm và 5 câu nghe viết. Đạt ít nhất 25/30 để ghi nhận kết quả đạt.',
      lessonQuizInstructions: 'Hoàn thành bài tập để lưu điểm và nhận sao. Không bắt buộc học theo thứ tự.',
      dictationQuestion: 'Nghe và viết từ bạn nghe được',
      meaningPrompt: 'Chọn từ tiếng Anh tương ứng với nghĩa:',
      playAudio: '🔊 Phát âm thanh',
      submitQuiz: 'Nộp bài và xem kết quả',
      quizAnswerNotice: 'Kết quả được chấm và lưu trên máy chủ.'
    },
    EN: {
      heroEyebrow: '✧ TOEIC VOCABULARY ROADMAP',
      heroTitleFirst: 'Build your vocabulary,',
      heroTitleSecond: 'one topic at a time.',
      heroDescription: 'Explore TOEIC topics, learn in short lessons, and track your progress from the first word to mastery.',
      heroNote: 'Small steps. Strong vocabulary. Confident answers.',
      topicStat: 'Topics',
      levelStat: 'Topics from foundation to advanced',
      stepsStat: 'Learn · practise · master',
      progressEyebrow: 'YOUR LEARNING PROGRESS',
      progressHeading: 'Keep moving through your roadmap',
      progressSummary: 'lessons completed ·',
      viewHistory: 'View history →',
      viewHistoryLabel: 'View history',
      guestEyebrow: 'GUEST PREVIEW',
      guestHeading: 'Explore the topics before you begin',
      guestDescription: 'Browse topics and learning paths. Sign in to study flashcards, take tests and save progress.',
      signIn: 'Sign in to sync progress →',
      curriculumEyebrow: 'YOUR TOEIC CURRICULUM',
      topicHeading: 'Choose a topic to start',
      topicDescription: 'Learn with flashcards, short lessons and practice tests.',
      topics: 'topics',
      levelBasic: 'Foundation',
      levelIntermediate: 'Intermediate',
      levelAdvanced: 'Advanced',
      lessons: 'lessons',
      complete: 'complete',
      placementPassedShort: 'Assessment passed',
      placementAvailable: 'Optional assessment available',
      openRoadmap: 'Open roadmap →',
      emptyTopics: 'No vocabulary topics yet',
      emptyTopicsText: 'Learning paths will appear here when the content is published.',
      wordEyebrow: 'WORD OF THE DAY',
      wordHeading: 'Word of the day',
      wordDescription: 'A quick review from the vocabulary bank.',
      randomWord: 'RANDOM WORD',
      exploreTopic: 'Explore this topic →',
      wordEmpty: 'A word will appear when topics are published.',
      topicIncludes: 'Every topic includes',
      stepFlashcards: 'Flashcards with examples',
      stepPractice: 'Exercises and dictation',
      stepPlacement: 'Assessment and progress',
      settingsSaved: 'Settings saved.',
      settingsSaveFailed: 'Could not save settings. Please try again.',
      signInPrompt: 'Sign in to save your learning progress.',
      wordMastered: 'Word saved as mastered.',
      saveWord: 'Save this word',
      savedWord: 'Saved',
      wordSavedNotice: 'Word saved to your notebook.',
      flashcardLoadFailed: 'Could not load the next flashcard.',
      saveWordFailed: 'Could not save this word. Please try again.',
      pronunciationUnavailable: 'Speech recognition is not available in this browser.',
      noWordAvailable: 'No vocabulary word is available.',
      pronunciationGood: 'Good pronunciation!',
      pronunciationRetry: 'Try again and listen to the sample.',
      microphoneUnavailable: 'Microphone access was not available. Check your browser permissions.',
      listening: 'Listening…',
      quizScore: 'You got',
      quizQuestions: 'questions correct.',
      backAllTopics: '← All topics',
      resultPlacementTitle: 'Assessment results',
      resultPracticeTitle: 'Practice results',
      answeredCorrectly: 'Correct answers:',
      questions: 'questions',
      placementPassedResult: 'Passed the optional assessment. All published lessons are available.',
      placementFailedResult: 'You need 25 correct answers. Review and try again.',
      lessonCompletedResult: 'Lesson completed ·',
      lessonPassHint: 'Score 70% to mark this lesson completed.',
      returnToTopics: 'Back to topics',
      answerDetails: 'Answer details',
      question: 'Question',
      correct: '✓ Correct',
      incorrect: '✗ Incorrect',
      yourAnswer: 'Your answer:',
      historyHeading: 'Practice history',
      historyDescription: 'Review your completed vocabulary quizzes',
      viewDetails: 'View details',
      noAttempts: 'No quizzes yet',
      startTopicHint: 'Choose a vocabulary topic to start practising.',
      chooseTopic: 'Choose a topic',
      adminRole: 'Administrator',
      learnerRole: 'Learner',
      signInSync: 'Sign in to sync your progress',
      placementTestTitle: 'OPTIONAL ASSESSMENT',
      lessonQuizTitle: 'LESSON QUIZ',
      multipleChoice: 'multiple choice',
      dictationLabel: 'dictation',
      passAt: 'pass at',
      audioUnavailable: 'Audio is not available for this question',
      audioPlaybackFailed: 'Could not play the audio. Please try again.',
      settings: '⚙ Display settings',
      theme: 'Theme',
      fontSize: 'Text size',
      language: 'Language',
      saveSettings: 'Save settings',
      backRoadmap: '← Back to roadmap',
      backTopic: '← Back to topic',
      lessonsCompleted: 'lessons completed',
      starsEarned: 'stars earned',
      wordsAvailable: 'available words',
      placementPassed: '✓ Assessment passed',
      takePlacement: 'Take optional assessment (30 questions)',
      signInPlacement: 'Sign in to take the placement test',
      placementHint: 'Optional assessment: pass at 25/30. Study any lesson in any order.',
      learningPath: 'YOUR LEARNING PATH',
      lessonsInTopic: 'Lessons in this topic',
      locked: 'Locked',
      inProgress: 'In progress',
      completed: 'Completed',
      open: 'Open',
      words: 'words',
      target: 'Target',
      openLesson: 'Start lesson →',
      lessonsPreparing: 'Lessons are being prepared',
      lessonsPreparingText: 'Lessons will appear here when the topic content is published.',
      learnAtYourPace: 'Study flashcards, take exercises, and practise dictation.',
      flashcards: 'Flashcards',
      exercises: 'Exercises',
      dictation: 'Dictation',
      pronunciation: 'Pronunciation',
      flashcardPractice: 'FLASHCARD PRACTICE',
      reviewWords: 'Review vocabulary',
      flipCardHint: 'Tap to flip the card',
      previous: '← Previous',
      listen: '🔊 Listen',
      markMastered: 'I know this',
      next: 'Next →',
      wordsPreparing: 'Vocabulary is being added',
      wordsPreparingText: 'This lesson does not have words to practise yet.',
      speakPractice: 'SPEAKING PRACTICE',
      pronunciationTitle: 'Practise pronunciation with your voice',
      pronunciationDescription: 'Listen to the sample, tap the microphone, and repeat. Your browser will compare the recognized speech.',
      startSpeaking: '🎙 Practise current word',
      placementInstructions: 'The test has 25 multiple-choice questions and 5 dictation questions. Optional assessment: pass at 25/30. Study any lesson in any order.',
      lessonQuizInstructions: 'Complete the exercise to save your score and earn stars. Study in any order.',
      dictationQuestion: 'Listen and write the word you hear',
      meaningPrompt: 'Choose the English word matching this meaning:',
      playAudio: '🔊 Play audio',
      submitQuiz: 'Submit and see results',
      quizAnswerNotice: 'Answers are graded and saved on the server.'
    }
  };

  const settings = document.querySelector('[data-vocab-settings]');
  let currentLanguage = settings && settings.querySelector('[data-setting="language"]')
    ? settings.querySelector('[data-setting="language"]').value
    : 'EN';
  function translate(key) {
    return translations[currentLanguage] && translations[currentLanguage][key]
      ? translations[currentLanguage][key]
      : key;
  }

  function applyPreferences(theme, fontSize, language) {
    currentLanguage = language;
    document.documentElement.dataset.vocabTheme = theme.toLowerCase();
    document.documentElement.dataset.vocabFontSize = fontSize.toLowerCase();
    document.documentElement.lang = language.toLowerCase();
    document.querySelectorAll('[data-i18n]').forEach(function (element) {
      const translated = translations[language] && translations[language][element.dataset.i18n];
      if (translated) element.textContent = translated;
    });
  }

  if (settings) {
    const controls = {
      theme: settings.querySelector('[data-setting="theme"]'),
      fontSize: settings.querySelector('[data-setting="fontSize"]'),
      language: settings.querySelector('[data-setting="language"]')
    };
    const status = settings.querySelector('[data-settings-status]');
    const saved = localStorage.getItem('n11-vocabulary-preferences');
    if (saved && settings.dataset.signedIn !== 'true') {
      try {
        const localPreferences = JSON.parse(saved);
        Object.keys(controls).forEach(function (key) {
          if (localPreferences[key]) controls[key].value = localPreferences[key];
        });
      } catch (error) {
        localStorage.removeItem('n11-vocabulary-preferences');
      }
    }
    const currentPreferences = function () {
      return {
        theme: controls.theme.value,
        fontSize: controls.fontSize.value,
        language: controls.language.value
      };
    };
    applyPreferences(controls.theme.value, controls.fontSize.value, controls.language.value);
    Object.keys(controls).forEach(function (key) {
      controls[key].addEventListener('change', function () {
        const values = currentPreferences();
        applyPreferences(values.theme, values.fontSize, values.language);
      });
    });
    settings.querySelector('[data-save-settings]').addEventListener('click', function () {
      const values = currentPreferences();
      localStorage.setItem('n11-vocabulary-preferences', JSON.stringify(values));
      if (settings.dataset.signedIn !== 'true') {
        status.textContent = translations[values.language].settingsSaved;
        return;
      }
      const body = new URLSearchParams(values);
      const headers = { 'Content-Type': 'application/x-www-form-urlencoded' };
      if (settings.dataset.csrfHeader && settings.dataset.csrfToken) {
        headers[settings.dataset.csrfHeader] = settings.dataset.csrfToken;
      }
      fetch(settings.dataset.settingsUrl, {
        method: 'POST',
        headers: headers,
        body: body.toString(),
        credentials: 'same-origin'
      }).then(function (response) {
        if (!response.ok) throw new Error('Unable to save display settings.');
        return response.json();
      }).then(function () {
        status.textContent = translations[values.language].settingsSaved;
      }).catch(function () {
        status.textContent = translations[values.language].settingsSaveFailed;
      });
    });
  }

  function shuffle(items) {
    const shuffled = items.slice();
    for (let index = shuffled.length - 1; index > 0; index--) {
      const target = Math.floor(Math.random() * (index + 1));
      [shuffled[index], shuffled[target]] = [shuffled[target], shuffled[index]];
    }
    return shuffled;
  }

  const flashcard = document.getElementById('vocabFlashcard');
  if (flashcard) {
    const status = document.getElementById('vocab-flashcard-status');
    const bookmark = document.getElementById('vocab-bookmark');
    let flipped = false;

    function renderFlashcard(data) {
      flipped = false;
      flashcard.dataset.id = data.id;
      flashcard.dataset.word = data.word || '';
      flashcard.dataset.phonetic = data.phonetic || '';
      flashcard.dataset.partOfSpeech = data.partOfSpeech || '';
      flashcard.dataset.meaning = data.meaningVi || '';
      flashcard.dataset.example = data.exampleSentence || '';
      flashcard.dataset.exampleMeaning = data.exampleMeaning || '';
      flashcard.classList.remove('is-flipped');
      flashcard.querySelector('.vocab-card-word').textContent = data.word || '';
      flashcard.querySelector('.vocab-card-phonetic').textContent = data.phonetic || '';
      flashcard.querySelector('.vocab-card-pos').textContent = data.partOfSpeech || '';
      flashcard.querySelector('.vocab-card-meaning').textContent = data.meaningVi || '';
      flashcard.querySelector('.vocab-card-example').textContent = data.exampleSentence || '';
      flashcard.querySelector('.vocab-card-example-meaning').textContent = data.exampleMeaning || '';
      if (bookmark) {
        bookmark.dataset.url = bookmark.dataset.url.replace(/\/flashcard\/\d+\/bookmark$/, '/flashcard/' + data.id + '/bookmark');
        bookmark.disabled = false;
        bookmark.textContent = translate('saveWord');
      }
    }

    function flipCard() {
      flipped = !flipped;
      flashcard.classList.toggle('is-flipped', flipped);
    }

    flashcard.addEventListener('click', flipCard);
    flashcard.addEventListener('keydown', function (event) {
      if (event.key === 'Enter' || event.key === ' ') {
        event.preventDefault();
        flipCard();
      }
    });
    document.getElementById('vocab-speak').addEventListener('click', function () {
      speak(flashcard.dataset.word);
    });
    document.getElementById('vocab-next').addEventListener('click', function () {
      const button = this;
      button.disabled = true;
      status.textContent = '';
      fetch(button.dataset.url, { headers: { Accept: 'application/json' }, credentials: 'same-origin' })
        .then(function (response) {
          if (!response.ok) throw new Error(translate('flashcardLoadFailed'));
          return response.json();
        })
        .then(function (data) {
          renderFlashcard(data);
          flipped = false;
        })
        .catch(function (error) {
          status.textContent = error.message;
        })
        .finally(function () {
          button.disabled = false;
        });
    });

    if (bookmark) {
      bookmark.addEventListener('click', function () {
        const button = this;
        const headers = { Accept: 'application/json' };
        if (button.dataset.csrfHeader && button.dataset.csrfToken) {
          headers[button.dataset.csrfHeader] = button.dataset.csrfToken;
        }
        button.disabled = true;
        status.textContent = '';
        fetch(button.dataset.url, {
          method: 'POST',
          headers: headers,
          credentials: 'same-origin'
        })
          .then(function (response) {
            if (response.redirected) {
              window.location.assign(response.url);
              return null;
            }
            if (!response.ok) throw new Error(translate('saveWordFailed'));
            return response.json();
          })
          .then(function (data) {
            if (!data) return;
            button.textContent = translate('savedWord');
            status.textContent = translate('wordSavedNotice');
          })
          .catch(function (error) {
            status.textContent = error.message;
            button.disabled = false;
          });
      });
    }
  }

  const wordCards = Array.from(document.querySelectorAll('.vocab-word-card')).map(function (card) {
    return {
      id: card.dataset.id || '',
      word: card.dataset.word || '',
      phonetic: card.dataset.phonetic || '',
      partOfSpeech: card.dataset.partOfSpeech || '',
      meaning: card.dataset.meaning || '',
      example: card.dataset.example || '',
      exampleMeaning: card.dataset.exampleMeaning || '',
      audioUrl: card.dataset.audioUrl || ''
    };
  });

  document.querySelectorAll('.vocab-pronounce').forEach(function (button) {
    button.addEventListener('click', function () {
      const card = button.closest('.vocab-word-card, .vocab-random-word');
      const word = card ? card.dataset.word : button.dataset.word;
      speak(word, card ? card.dataset.audioUrl : '');
    });
  });

  const flashcardPanel = document.getElementById('vocabulary-flashcards');
  const quizPanel = document.getElementById('vocabulary-quiz');
  let createQuiz = function () {};
  document.querySelectorAll('a[href="#vocabulary-flashcards"], a[href="#vocabulary-quiz"]').forEach(function (link) {
    link.addEventListener('click', function (event) {
      event.preventDefault();
      const target = link.getAttribute('href') === '#vocabulary-flashcards' ? flashcardPanel : quizPanel;
      if (!target) return;
      target.hidden = false;
      target.scrollIntoView({ behavior: 'smooth', block: 'start' });
      if (target === quizPanel) createQuiz();
    });
  });

  if (wordCards.length) {
    let currentIndex = 0;
    let studyFlipped = false;
    const studyCard = document.getElementById('vocab-study-card');
    if (!studyCard) return;

    // N11_V46_FREE_STUDY: two-sided flashcard, independent review state.
    const originalCards = wordCards.slice();
    const masteredThisVisit = new Set();
    const reviewThisVisit = new Set();
    const byId = id => document.getElementById(id);
    const status = byId('vocab-flashcard-status');
    const masteredButton = byId('vocab-mark-mastered');
    const reviewButton = byId('v46-review');
    const picker = byId('v46-picker');
    let saving = false;
    function updatePicker() {
      picker.replaceChildren();
      wordCards.forEach((item,i) => {
        const option = document.createElement('option');
        option.value = String(i); option.textContent = `${i+1}. ${item.word}`;
        picker.append(option);
      });
    }
    function renderStudyCard() {
      const item = wordCards[currentIndex];
      if (!item) return;
      studyCard.classList.toggle('is-flipped',studyFlipped);
      studyCard.setAttribute('aria-pressed',String(studyFlipped));
      studyCard.setAttribute('aria-label',studyFlipped?'Lật về mặt tiếng Anh':'Lật thẻ để xem nghĩa');
      studyCard.dataset.id=item.id; studyCard.dataset.word=item.word;
      byId('v46-front').setAttribute('aria-hidden',String(studyFlipped));
      byId('v46-back').setAttribute('aria-hidden',String(!studyFlipped));
      studyCard.querySelector('.vocab-study-counter').textContent=`${currentIndex+1} / ${wordCards.length}`;
      studyCard.querySelector('.vocab-study-word').textContent=item.word;
      studyCard.querySelector('.vocab-study-phonetic').textContent=item.phonetic || '';
      byId('v46-back-word').textContent=item.word;
      studyCard.querySelector('.vocab-study-meaning').textContent=item.meaning || 'Chưa có nghĩa';
      studyCard.querySelector('.vocab-study-example').textContent=item.example || '';
      studyCard.querySelector('.vocab-study-example-meaning').textContent=item.exampleMeaning || '';
      picker.value=String(currentIndex);
      byId('v46-known-count').textContent=`${masteredThisVisit.size}/${originalCards.length} đã thuộc trong phiên này`;
      byId('v46-review-count').textContent=`${reviewThisVisit.size} cần ôn`;
      const pct=100*masteredThisVisit.size/originalCards.length;
      byId('v46-progress').value=pct;
      masteredButton.classList.toggle('v46-marked',masteredThisVisit.has(item.id));
      reviewButton.classList.toggle('v46-marked',reviewThisVisit.has(item.id));
      masteredButton.setAttribute('aria-pressed',String(masteredThisVisit.has(item.id)));
      reviewButton.setAttribute('aria-pressed',String(reviewThisVisit.has(item.id)));
      masteredButton.disabled=saving;reviewButton.disabled=saving;
      byId('v46-only-review').disabled=!reviewThisVisit.size;
    }
    function flip() {studyFlipped=!studyFlipped;renderStudyCard();}
    function go(index) {
      currentIndex=(index+wordCards.length)%wordCards.length;studyFlipped=false;
      if(status)status.textContent='';renderStudyCard();
      if(byId('v46-auto-audio').checked)play();
    }
    function play() {
      const item=wordCards[currentIndex];
      if(!item.audioUrl && !window.speechSynthesis){status.textContent='Trình duyệt không hỗ trợ đọc từ.';return;}
      speak(item.word,item.audioUrl).catch(()=>{status.textContent='Không phát được âm thanh. Hãy thử lại.';});
    }
    function setDeck(items){if(!items.length)return;wordCards.splice(0,wordCards.length,...items);updatePicker();go(0);}
    studyCard.addEventListener('click',flip);
    studyCard.addEventListener('keydown',event=>{
      if(event.key==='Enter'||event.key===' '){event.preventDefault();flip();}
      else if(event.key==='ArrowLeft'){event.preventDefault();go(currentIndex-1);}
      else if(event.key==='ArrowRight'){event.preventDefault();go(currentIndex+1);}
      else if(event.key.toLowerCase()==='s'){event.preventDefault();play();}
    });
    byId('vocab-study-prev').addEventListener('click',()=>go(currentIndex-1));
    byId('vocab-study-next').addEventListener('click',()=>go(currentIndex+1));
    byId('vocab-study-speak').addEventListener('click',play);
    picker.addEventListener('change',()=>go(Number(picker.value)));
    byId('v46-shuffle').addEventListener('click',()=>setDeck(shuffle(wordCards)));
    byId('v46-reset').addEventListener('click',()=>setDeck(originalCards));
    byId('v46-only-review').addEventListener('click',()=>setDeck(originalCards.filter(item=>reviewThisVisit.has(item.id))));
    async function mark(value){
      if(saving)return;
      if(masteredButton.dataset.signedIn!=='true'){status.textContent=translate('signInPrompt');return;}
      const item=wordCards[currentIndex];saving=true;renderStudyCard();
      const headers={'Content-Type':'application/x-www-form-urlencoded'};
      if(masteredButton.dataset.csrfHeader&&masteredButton.dataset.csrfToken)headers[masteredButton.dataset.csrfHeader]=masteredButton.dataset.csrfToken;
      try{
        const response=await fetch(masteredButton.dataset.progressUrl.replace('__TERM_ID__',encodeURIComponent(item.id)),{method:'POST',headers,body:'status='+value,credentials:'same-origin'});
        if(!response.ok||response.redirected||!(response.headers.get('content-type')||'').includes('json'))throw new Error('Không lưu được. Kiểm tra đăng nhập và thử lại.');
        const data=await response.json();if(data.success!==true)throw new Error('Không lưu được trạng thái.');
        if(value==='MASTERED'){masteredThisVisit.add(item.id);reviewThisVisit.delete(item.id);}
        else{masteredThisVisit.delete(item.id);reviewThisVisit.add(item.id);}
        status.textContent=item.word+' — '+(value==='MASTERED'?'Đã lưu: đã thuộc.':'Đã lưu: cần ôn lại.');
      }catch(error){status.textContent=error.message;}
      finally{saving=false;renderStudyCard();}
    }
    masteredButton.addEventListener('click',()=>mark('MASTERED'));
    reviewButton.addEventListener('click',()=>mark('LEARNING'));
    updatePicker();
    const closeStudyButton = document.getElementById('vocab-close-study');
    if (closeStudyButton && flashcardPanel) {
      closeStudyButton.addEventListener('click', function () {
        flashcardPanel.hidden = true;
      });
    }

    let quizQuestions = [];
    createQuiz = function () {
      const panel = document.getElementById('vocab-quiz-questions');
      const result = document.getElementById('vocab-quiz-result');
      if (!panel || !result) return;
      panel.replaceChildren();
      result.textContent = '';
      quizQuestions = shuffle(wordCards).slice(0, Math.min(5, wordCards.length)).map(function (item) {
        const distractors = shuffle(wordCards.filter(function (candidate) {
          return candidate.word !== item.word;
        })).slice(0, 3);
        const options = shuffle([item].concat(distractors));
        return { item: item, options: options };
      });

      quizQuestions.forEach(function (question, index) {
        const fieldset = document.createElement('fieldset');
        fieldset.className = 'vocab-quiz-question';
        const legend = document.createElement('h3');
        legend.textContent = (index + 1) + '. ' + question.item.word;
        fieldset.appendChild(legend);
        question.options.forEach(function (option, optionIndex) {
          const label = document.createElement('label');
          label.className = 'vocab-quiz-option';
          const input = document.createElement('input');
          input.type = 'radio';
          input.name = 'vocab-quiz-' + index;
          input.value = option.word;
          const text = document.createElement('span');
          text.textContent = option.meaning;
          label.appendChild(input);
          label.appendChild(text);
          fieldset.appendChild(label);
        });
        panel.appendChild(fieldset);
      });
    };

    const quizCheckButton = document.getElementById('vocab-quiz-check');
    if (quizCheckButton) {
      quizCheckButton.addEventListener('click', function () {
        if (!quizQuestions.length) createQuiz();
        let correct = 0;
        quizQuestions.forEach(function (question, index) {
          const selected = document.querySelector('input[name="vocab-quiz-' + index + '"]:checked');
          if (selected && selected.value === question.item.word) correct++;
        });
        document.getElementById('vocab-quiz-result').textContent =
          translate('quizScore') + ' ' + correct + ' / ' + quizQuestions.length + ' ' + translate('quizQuestions');
      });
    }
    const closeQuizButton = document.getElementById('vocab-close-quiz');
    if (closeQuizButton && quizPanel) {
      closeQuizButton.addEventListener('click', function () {
        quizPanel.hidden = true;
      });
    }
    renderStudyCard();
  }

  document.querySelectorAll('.vocab-speak-prompt').forEach(function (button) {
    button.addEventListener('click', function () {
      /* N11_V44_TTS: practice fallback when no recording is stored. */
      if (button.dataset.v44Tts && !window.speechSynthesis) {
        const status=document.getElementById('vocab-dictation-status');
        if(status) status.textContent='Trình duyệt không hỗ trợ đọc từ. Hãy dùng Edge hoặc Chrome có giọng tiếng Anh.';
        return;
      }
      speak(button.dataset.word || '', button.dataset.audioUrl).catch(function (error) {
        document.getElementById('vocab-dictation-status').textContent = error.message;
      });
    });
  });

  const pronunciationButton = document.getElementById('vocab-pronunciation-check');
  if (pronunciationButton) {
    pronunciationButton.addEventListener('click', function () {
      const status = document.getElementById('vocab-pronunciation-status');
      const Recognition = window.SpeechRecognition || window.webkitSpeechRecognition;
      if (!Recognition) {
        status.textContent = translate('pronunciationUnavailable');
        return;
      }
      const current = document.getElementById('vocab-study-card');
      const target = current ? current.dataset.word : '';
      if (!target) {
        status.textContent = translate('noWordAvailable');
        return;
      }
      const recognition = new Recognition();
      recognition.lang = 'en-US';
      recognition.maxAlternatives = 3;
      recognition.onresult = function (event) {
        const targetWord = target.toLowerCase().trim();
        const heard = Array.from(event.results[0]).map(function (result) {
          return result.transcript.toLowerCase().trim();
        });
        const matched = heard.some(function (value) { return value === targetWord; });
        status.textContent = matched ? translate('pronunciationGood') : translate('pronunciationRetry');
      };
      recognition.onerror = function () {
        status.textContent = translate('microphoneUnavailable');
      };
      status.textContent = translate('listening');
      recognition.start();
    });
  }
})();
