class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    
    @title = title
    @contents = contents
  end

  def title

    # Returns the title as a string
    return @title
  end

  def contents

    # Returns the contents as a string
    return @contents
  end

  def count_words

    # Returns the number of words in the contents as an integer
    @contents.split(" ").length
  end

  def reading_time(wpm) # wpm is an integer representing the number of words the
                        # user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.

    # provides appropriate fail message if wpm is less than 0
    fail "Reading speed must be above zero!" unless wpm > 0

    return (count_words / wpm.to_f).ceil 
    # uses count words method and divides it by wpm and finally rounds the total up
    # wmp is converted into a float, divides it and rounds total up
  end

  def reading_chunk(wpm, minutes) 
    return @contents
  end
end