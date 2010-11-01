class TextBuffer
  class NotYetImplemented < StandardError; end

  attr_accessor :lines, :file, :current_line, :current_column

  def initialize
    self.lines ||= []
    self.current_line = 0
    self.current_column = 0
  end

  def text
    lines.map { |line| line.text }.join()
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

  def text
    self.words.map { |word| word.text }.join("") + separator
  end
end

class Word
  attr_accessor :body, :separator

  def initialize(body = "", separator = "")
    self.body = body
    self.separator = separator
  end

  def text
    body.to_s + separator.to_s
  end

  def length
    body.length + separator.length
  end
end
