class AbstactTextBuffer
  constructor: (text) ->
    text.split(@splitter).map

class TextBuffer extends AbstractTextBuffer
  splitter: /(\n)/
  collectionClass: Line
  constructor: (@text) ->

class Line extends AbstractTextBuffer
  splitter: /(\s+)/
  collectionClass: Word
    constructor: (@text) ->

class Word extends AbstractTextBuffer
  splitter: ""
  collectionClass: null
  constructor: (@text) ->
