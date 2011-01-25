class AbstractTextBuffer
  constructor: (text) ->
    raw_arr = atom for text.split(this.splitter).map

class Word extends AbstractTextBuffer
  splitter: ""

  collectionClass: null

  constructor: (@text) ->

class Line extends AbstractTextBuffer
  splitter: /(\s+)/

  collectionClass: Word

  constructor: (@text) ->

class TextBuffer extends AbstractTextBuffer
  constructor: (@text) ->

  splitter: /(\n)/

  collectionClass: Line

