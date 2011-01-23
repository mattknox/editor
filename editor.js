Object.prototype.begetObject = function () {
  function F() {}
  F.prototype = this;
  return new F();
};

// newObject = oldObject.begetObject();

function AbstractTextCollection(text){
  this.splitRegex = /(\n)/;
  this.collectionClass = Word;
  this.collection = text.split(this.splitRegex).map( function(x) { return new Word(x);});
}

AbstractTextCollection.prototype.toString = function() {
  return this.collection.map(function(elt){ return elt.toString();}).join("");
};

function Word(text) {
  this.splitRegex = "";
  this.collectionClass = null;
  this.collection = text;
}

Word.prototype.toString = function() {
  return this.collection.map(function(e){ return e.toString();}).join("");
};

function Line(){
  this.splitRegex = /(\s+)/;
  this.collectionClass = Word;
}

function TextBuffer(){
  this.splitRegex = /(\n)/;
  this.collectionClass = Line;
}

function handleEvent(e) {
  handleKeyPress(String.fromCharCode(e.keyCode), e.shiftKey, e.ctrlKey, e.altKey, e.metaKey);
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
