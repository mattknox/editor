Object.prototype.begetObject = function () {
  function F() {}
  F.prototype = this;
  return new F();
};

// newObject = oldObject.begetObject();

function AbstractTextCollection(text){
  this.splitRegex = /(\n)/;
  this.collectionClass = Word;
  if (text) {
    this.collection = text.split(this.splitRegex).map( function(x) { return new Word(x);});
  }
}

AbstractTextCollection.prototype.toString = function() {
  if ("string" == typeof this.collection) {
    return this.collection;
  } else {
    return this.collection.map(function(elt){ return elt.toString();}).join("");
  }
};

function Word(text) {
  this.splitRegex = "";
  this.collectionClass = null;
  this.collection = text;
}

Word.prototype = new AbstractTextCollection(); 
Word.prototype.constructor=Word;

function Line(){
  this.splitRegex = /(\s+)/;
  this.collectionClass = Word;
}

Line.prototype = new AbstractTextCollection(); 
Line.prototype.constructor=Line;

function TextBuffer(){
  this.splitRegex = /(\n)/;
  this.collectionClass = Line;
}

TextBuffer.prototype = new AbstractTextCollection(); 
TextBuffer.prototype.constructor=TextBuffer;

function handleEvent(e) {
  if ($debug()) {
    debugEvent(e);
  }

  if (e.keyCode == 13) {
    document.getElementById("code").innerHTML += "<br/>";
  } else {
    handleKeyPress(String.fromCharCode(e.keyCode), e.shiftKey, e.ctrlKey, e.altKey, e.metaKey);
  }
}

function ignoreEvent(e) {
  return e;
}

function handleKeyPress(charCode, shift, ctrl, alt, meta) {
  document.getElementById("code").innerHTML += charCode;
}

var Clear = function clear() {
  document.getElementById("debug_pane").innerHTML = "";
};

var $debug = function () {
  var on = false;

  return function () {
    if (arguments.length == 1) {
      on = arguments[0];
    }
    return on;
  };
}();

function debugEvent(e) {
  debug_pane = document.getElementById("debug_pane");
  str = "type=" + e.type + "<br/>";
  str += "keyCode=" + e.keyCode + "<br/>";
  str += "which=" + e.which + "<br/>";
  document.getElementById("debug_pane").innerHTML += str;
  e.preventDefault();
}

function handleSpecialKeys(e) {
  if (e.keyCode == 8 ) {
    e.preventDefault();
  }
}
