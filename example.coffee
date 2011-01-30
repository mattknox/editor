sys = require "sys"

class Animal
  constructor: (@name) ->

  move: (meters) =>
    sys.puts @name + " moved " + meters + "m."

class Snake extends Animal
  splitter: "scales"
  move: ->
    sys.puts "Slithering..."
    super 5

class Horse extends Animal
  splitter: "hooves"
  move: ->
    sys.puts "Galloping..."
    super 45

sam = new Snake "Sammy the Python"
tom = new Horse "Tommy the Palomino"

sam.move()
tom.move()
