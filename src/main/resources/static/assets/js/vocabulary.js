(function () {
  'use strict';

  function speak(word, audioUrl) {
    if (audioUrl) {
      const audio = new Audio(audioUrl);
      audio.play().catch(function () {
        speakWithSpeechSynthesis(word);
      });
      return;
    }
    speakWithSpeechSynthesis(word);
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
        bookmark.textContent = 'Lưu từ này';
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
          if (!response.ok) throw new Error('Không tải được flashcard tiếp theo.');
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
            if (!response.ok) throw new Error('Không thể lưu từ vựng. Vui lòng thử lại.');
            return response.json();
          })
          .then(function (data) {
            if (!data) return;
            button.textContent = 'Đã lưu';
            status.textContent = 'Từ vựng đã được lưu vào sổ tay của bạn.';
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
      const card = button.closest('.vocab-word-card');
      speak(card.dataset.word, card.dataset.audioUrl);
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

    function renderStudyCard() {
      if (!studyCard || !wordCards.length) return;
      const item = wordCards[currentIndex];
      studyCard.classList.toggle('is-flipped', studyFlipped);
      studyCard.querySelector('.vocab-study-counter').textContent = (currentIndex + 1) + ' / ' + wordCards.length;
      studyCard.querySelector('.vocab-study-word').textContent = item.word;
      studyCard.querySelector('.vocab-study-phonetic').textContent = item.phonetic;
      studyCard.querySelector('.vocab-study-meaning').textContent = studyFlipped ? item.meaning : '';
      studyCard.querySelector('.vocab-study-example').textContent = studyFlipped ? item.example : '';
      studyCard.querySelector('.vocab-study-example-meaning').textContent = studyFlipped ? item.exampleMeaning : '';
    }

    studyCard.addEventListener('click', function () {
      studyFlipped = !studyFlipped;
      renderStudyCard();
    });
    studyCard.addEventListener('keydown', function (event) {
      if (event.key === 'Enter' || event.key === ' ') {
        event.preventDefault();
        studyFlipped = !studyFlipped;
        renderStudyCard();
      }
    });
    document.getElementById('vocab-study-prev').addEventListener('click', function () {
      currentIndex = (currentIndex - 1 + wordCards.length) % wordCards.length;
      studyFlipped = false;
      renderStudyCard();
    });
    document.getElementById('vocab-study-next').addEventListener('click', function () {
      currentIndex = (currentIndex + 1) % wordCards.length;
      studyFlipped = false;
      renderStudyCard();
    });
    document.getElementById('vocab-study-speak').addEventListener('click', function () {
      speak(wordCards[currentIndex].word, wordCards[currentIndex].audioUrl);
    });
    document.getElementById('vocab-close-study').addEventListener('click', function () {
      flashcardPanel.hidden = true;
    });

    let quizQuestions = [];
    createQuiz = function () {
      const panel = document.getElementById('vocab-quiz-questions');
      const result = document.getElementById('vocab-quiz-result');
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

    document.getElementById('vocab-quiz-check').addEventListener('click', function () {
      if (!quizQuestions.length) createQuiz();
      let correct = 0;
      quizQuestions.forEach(function (question, index) {
        const selected = document.querySelector('input[name="vocab-quiz-' + index + '"]:checked');
        if (selected && selected.value === question.item.word) correct++;
      });
      document.getElementById('vocab-quiz-result').textContent =
        'Bạn trả lời đúng ' + correct + ' / ' + quizQuestions.length + ' câu.';
    });
    document.getElementById('vocab-close-quiz').addEventListener('click', function () {
      quizPanel.hidden = true;
    });
    renderStudyCard();
  }
})();
