class DiaryEntry
  def initialize(title, contents) # title, contents are strings

    @title = title
    @contents = contents
    @furthest_word_read = 0 #new varibale that stores the most recently read word in contents
    # begins at 0
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

    individual_word.length #called the private method containing @contents
    # was previously @contents.split(" ").length
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
    words_we_can_read = wpm * minutes # variable created for the amount of words of possible to read
    start_from = @furthest_word_read
    end_at = @furthest_word_read + words_we_can_read
    word_list = individual_word[start_from, end_at] # word_list accesses the private method individual_word

    if end_at > count_words # if the last word we can read is greater than the total word count,
      @furthest_word_read = 0 # the furthest word read goes back to zero and the program restarts
    else
      @furthest_word_read = end_at
    end

    return word_list.join(" ")
  end

  private 
        #private method that isn't visible outside the object
          # used inside the object as a utility method
  def individual_word
    return @contents.split(" ") #calls split method on the contents array to seperate each word
  end

end