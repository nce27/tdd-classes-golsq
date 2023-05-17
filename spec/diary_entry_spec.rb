require "diary_entry"

RSpec.describe DiaryEntry do
  it "constructs using title and contents" do
    diary_entry = DiaryEntry.new("my_title", "my_contents")
    expect(diary_entry.title).to eq "my_title"
    expect(diary_entry.contents).to eq "my_contents"
  end

  #describe block works in the same way as a context
  describe "#count_words" do #the hash stands for instance method
    it "returns number of words in contents as an integer" do
      diary_entry = DiaryEntry.new("my_title", "This is a word count")
      expect(diary_entry.count_words).to eq 5
    end
  end

end
