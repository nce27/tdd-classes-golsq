require "diary_entry"

RSpec.describe DiaryEntry do
  it "constructs using title and contents" do
    diary_entry = DiaryEntry.new("my_title", "my_contents")
    expect(diary_entry.title).to eq "my_title"
  end
end