Letters = function() {
  this.lettersDOM = null;
  this.active = null;
  this.letters = [];
  this.alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "i", "u", "v", "w", "x", "y", "z", "~", "&", "|", "^", "ç", "@", "]", "[", "{", "}", "ù", "*", "µ", "¤", "$", "£", "€", "°", ")", "(", "+", "-", "/", "<", ">", "²", "`", "é", "è", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"];
  return this;
};

Letters.prototype.init = function(word) {
  this.lettersDOM = document.querySelectorAll('.letter');
  this.active = true;
  var i;
  var nextChar;
  var lettersMax = this.lettersDOM.length;

  for (i = 0; i < this.lettersDOM.length; i++) {
    if (word.charAt(i) != "") nextChar = word.charAt(i);
    else nextChar = false;

    this.letters.push(new Letter(this.lettersDOM[i], nextChar));
  }

  if (word.length > lettersMax) {
    var wordContainer = document.getElementById("word");

    for (i = lettersMax; i < word.length; i++) {
      var letterSpan = document.createElement('span');
      letterSpan.innerHTML = "";
      letterSpan.classList.add('letter');
      wordContainer.appendChild(letterSpan);
      this.letters.push(new Letter(letterSpan, word.charAt(i)));
    }
  }

  this.animate();
  return this;
};

Letters.prototype.animate = function() {
  var i;
  var random;
  var char;

  if (this.active) {
    window.requestAnimationFrame(this.animate.bind(this));

    var indexes = [];

    for (i = 0; i < this.letters.length; i++) {
      var current = this.letters[i];

      if (!current.isDead) {
        random = Math.floor(Math.random() * (this.alphabet.length - 0));
        char = this.alphabet[random];
        current.render(char);
      } else {
        indexes.push(i);
      }
    }

    for (i = 0; i < indexes.length; i++) {
      this.letters.splice(indexes[i], 1);
    }

    if (this.letters.length == 0) {
      this.stop();
    }
  }
};

Letters.prototype.start = function(word) {
  this.init(word);
};

Letters.prototype.stop = function() {
  this.active = false;
};

Letter = function(DOMElement, nextChar) {
  var scope = this;
  this.DOMEl = DOMElement;
  this.char = DOMElement.innerHTML;
  this.next = nextChar;
  this.speed = Math.floor(Math.random() * (500 - 100));
  this.total = 0;
  this.duration = 1500;
  this.animating = true;
  this.isDead = false;

  this.timer = setInterval(function() {
    if (scope.animating === true) {
      scope.total += scope.speed;
    }
    scope.animating = !scope.animating;
  }, this.speed);

  this.animate();

  return this;
};

Letter.prototype.animate = function() {
  var i;
  var random;

  if (!this.isDead) {
    window.requestAnimationFrame(this.animate.bind(this));
  }

  if (this.total < this.duration) {
    if (this.animating) {
      this.DOMEl.innerHTML = this.char;
    }
  } else {
    this.isDead = true;

    if (!this.next) {
      var parent = document.getElementById('word');
      parent.removeChild(this.DOMEl);
      return;
    }

    this.DOMEl.innerHTML = this.next;
  }
};

Letter.prototype.render = function(char) {
  if (!this.animating) {
    this.char = char;
  }
};

var words = [];
var nextWord = 0;
var letters = new Letters();

fetch('https://raw.githubusercontent.com/piron-ph/zeya/refs/heads/main/ilove.txt')
  .then(response => response.text())
  .then(data => {
    words = data.split('\n');
    startNextWord();

    setInterval(function() {
      nextWord++;
      if (nextWord >= words.length) nextWord = 0;
      startNextWord();
    }, 15000);
  })
  .catch(error => console.error("Error fetching the words file:", error));

function startNextWord() {
  if (words.length > 0) {
    letters.start(words[nextWord]);
  }
}
// Handle hidden message button
const hiddenMessageButton = document.getElementById('hiddenMessage');
hiddenMessageButton.addEventListener('click', function() {
  // Replace the animation with the hidden message
  const wordContainer = document.getElementById("word");
  wordContainer.innerText = "I can't thank heaven enough that I found you";

  // Stop the animation
  letters.stop();

  // After 5 seconds, reset the message and resume the animation
  setTimeout(function() {
    // Clear the hidden message
    wordContainer.innerText = "";

    // Resume the animation with the next word
    startNextWord(); // This will trigger the animation for the next word

    // Resume the animation
    letters.active = true;
    letters.animate();
  }, 5000); // Hide the message and resume animation after 5 seconds
});


