function textCollectionBuilder(splitter, collectionClass) {
  var split = function(str, splitter) {
    // x.collection[0].collection.map(function(x) {return x.text();}).join(" ")
    this.text = function() {
      return this.collection.map(function (x) {return x.text();}).join("");
    };
    return this.collection = str.split(splitter).map( function(x) { return collectionClass(x);});
  };
 
  return function (text) {
    split(text, splitter);
    return {
      splitter: split,
      collectionClass: collectionClass,
      collection: this.collection,
      text: this.text
    };
  };
}

// build word, line, and textbuffer, and then extract.
function word(str, delim) {
  return {
    content: str,
    delim: delim,
    text: function() { return this.content + this.delim; },
    appendContent: function (val) { this.content += val; },
    setContent: function (val) { this.content = val; },
    appendDelim:   function (val) { this.delim += val; },
    setDelim:   function (val) { this.delim = val; }
  };
}

function line(str){
  var arr = str.split(/(\s+)/);
  var collection = [];
  while (arr.length > 0) {
    w = arr.shift();
    d = arr.shift() || "";
    collection.push(word(w, d));
  }
  return {
    collection: collection,
    text: function() { return this.collection.map(function(){ return this.text();}).join(""); }
  };
}

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
