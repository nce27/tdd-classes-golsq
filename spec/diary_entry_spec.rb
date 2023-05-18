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

    it "returns zero when contents is empty" do
      diary_entry = DiaryEntry.new("my_title", "")
      expect(diary_entry.count_words).to eq 0
    end
  end

  describe "#reading_time" do
    context "when given a sensible wpm reading time (200)" do
      it "returns the ceiling (rounded up) of a the number of mins to read the content" do
        diary_entry = DiaryEntry.new("my_title", "one " * 550)
        expect(diary_entry.reading_time(200)).to eq 3
      end
    end

    context "when given a wpm of 0" do
      it "fails" do
        diary_entry = DiaryEntry.new("my_title", "these are words")
        expect { diary_entry.reading_time(0) }.to raise_error "Reading speed must be above zero!"
      end
    end
  end


    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.

  describe "#reading_chunk" do
    context "with contents readable within the given number of minutes" do
      it "returns the full string" do
        diary_entry = DiaryEntry.new("my_title", "one two three")
        chunk = diary_entry.reading_chunk(200, 1)
        expect(chunk).to eq "one two three"
      end
    end

    context "with contents unreadable within the given number of minutes" do
      it "returns only the readable chunk" do
        diary_entry = DiaryEntry.new("my_title", "one two three")
        chunk = diary_entry.reading_chunk(2, 1) #2 words per minute
        expect(chunk).to eq "one two" #so it can only process 2 out of the 3 contents
      end

      it "returns the next chunk, next time we are asked" do
        diary_entry = DiaryEntry.new("my_title", "one two three")
        diary_entry.reading_chunk(2, 1) 
        chunk = diary_entry.reading_chunk(2, 1)
        expect(chunk).to eq "three" 
      end
    end
  end
end