class TextBuffer
  class NotYetImplemented < StandardError; end

  attr_accessor :lines, :file, :current_line, :current_column

  def initialize
    self.lines ||= []
    self.current_line = 0
    self.current_column = 0
  end

  def to_s
    lines.map { |line| line.to_s }.join()
  end

  def text=(text)
    text.split(/(\n)/).each_slice(2) do |body, separator|
      lines << Line.new(body, separator)
    end
  end

  def save
    raise NotYetImplemented
  end

  def insert(char)
    raise NotYetImplemented
  end

  def delete
    raise NotYetImplemented
  end

  def right
    raise NotYetImplemented
  end

  def left
    raise NotYetImplemented
  end

  def up
    raise NotYetImplemented
  end

  def down
    raise NotYetImplemented
  end
end

class Line
  attr_accessor :words, :separator

  def initialize(text = "", separator = "")
    self.words = []
    self.text = text
    self.separator = separator
  end

  def text=(text)
    text.split(/(\s+)/).each_slice(2) do |body, separator|
      words << Word.new(body, separator)
    end
  end

  def to_s
    self.words.map { |word| word.to_s }.join("") + separator
  end
end

class Word
  attr_accessor :body, :separator

  def initialize(body = "", separator = "")
    self.body = body
    self.separator = separator
  end

  def to_s
    body.to_s + separator.to_s
  end

  def length
    body.length + separator.length
  end
end


class AbstractTextCollection
  attr_accessor :collection, :separator, :terminal

  def initialize(text, separator = "")
    self.collection = []
    self.separator = ""
    self.text = text
  end

  def to_s
    collection.map { |element| element.to_s }.join("") + separator
  end
end

class DoublyLinkedList
  attr_accessor :data, :back, :forward
end
