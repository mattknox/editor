require "./text_buffer"

$str = <<FOO
here is a long string
containing many lines

and some blank lines



and also lines with single words
like
this

and
this


FOO

describe TextBuffer do
  describe "to_s" do
    it "should reply to text with the text put in" do
      t = TextBuffer.new $str

      t.to_s.should == $str
    end
  end
end

describe DConsCell do
  list = DConsCell.new(1, nil, nil)
  t = DConsCell.new(7, nil, list)
  list.next_node = t
  describe "inspect" do
    it "should return (1,7) on the demo list" do
      list.inspect.should == "(1,7)"
    end
  end
  describe "from_array" do
    it "should return the same dll from the array [1,7]" do
      DConsCell.from_array([1,7]).inspect.should == "(1,7)"
    end
  end
end
