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
  describe "text" do
    it "should reply to text with the text put in" do
      t = TextBuffer.new
      t.text = $str

      t.text.should == $str
    end
  end
end
