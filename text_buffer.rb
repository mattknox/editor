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
  def split_regex; /(\n)/ end
  def collection_class; Line end
end

class EditableBuffer
  class NotYetImplemented < StandardError; end

  attr_accessor :file, :current_line, :current_column

  def initialize(text = "", separator = "")
    super
    self.current_line = 0
    self.current_column = 0
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

class Line < AbstractTextCollection
  def split_regex; /(\s+)/ end
  def collection_class; Word end
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

class DConsCell
  attr_accessor :data, :next_node, :prev_node

  def initialize(data, next_node = nil, prev_node = nil)
    self.data = data
    self.next_node = next_node
    self.prev_node = prev_node
  end

  def self.from_array(arr)
    prev_node = nil
    head = nil
    arr.each do |elt|
      curr = new(elt, nil, prev_node)
      head ||= curr
      prev_node && prev_node.next_node = curr
      prev_node = curr
    end
    head
  end

  def car
    self.data
  end

  def cdr
    self.next_node
  end


  def inspect(sep = ",", start = "(", finish = ")")
    start = prev_node ? '' : start
    ending = next_node ? "#{sep}#{next_node.inspect}" : finish
    "#{start}#{data}#{ending}"
  end
end

def reload
  eval File.read("./text_buffer.rb")
end

def cons(*args)
  DConsCell.new *args
end
