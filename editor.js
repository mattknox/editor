function AbstractTextCollection(){
  this.collection = [];
}

AbstractTextCollection.prototype.toString = function() {
  return this.collection.join("");
};


function Word() {
  this.splitRegex = /(.)/;
  this.collectionClass = null;
}

function Line(){
  this.splitRegex = /(\s+)/;
  this.collectionClass = Word;
}

function TextBuffer(){
  this.splitRegex = /(\n)/;
  this.collectionClass = Line;
}
