class AbstractTextCollection
  attr_accessor :collection, :separator, :terminal

  def initialize(text = "", separator = "")
    self.collection = []
    self.separator = separator
    self.text = text
  end

  def to_s
    collection.map { |element| element.to_s }.join("") + separator
  end

  def text=(text)
    text.split(split_regex).each_slice(2) do |body, separator|
      collection << collection_class.new(body, separator)
    end
  end
end

class TextBuffer < AbstractTextCollection
  class NotYetImplemented < StandardError; end

  attr_accessor :file, :current_line, :current_column

  def initialize(text = "", separator = "")
    super
    self.current_line = 0
    self.current_column = 0
  end

  def split_regex; /(\n)/; end
  def collection_class; Line; end

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

class Line < AbstractTextCollection
  def split_regex; /(\s+)/; end
  def collection_class; Word; end
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

class DoublyLinkedList
  attr_accessor :data, :back, :forward
end
