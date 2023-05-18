class GrammarStats
  def initialize
    @check = true
    @pass_count = 0
    @total_count = 0
  end

  def check(text) # text is a string
    # Returns true or false depending on whether the text begins with a capital
    # letter and ends with a sentence-ending punctuation mark.

    fail "Cannot check an empty string" if text.empty? #fails if given an empty string 

    first_char = text[0] #first letter of the text"
    last_char = text[-1]

    ends_with_punctuation = last_char.match? (/[.!?]/) 
    starts_with_capital = first_char.match? (/[A-Z]/)

    result = starts_with_capital && ends_with_punctuation

    if result
      @pass_count += 1
    end
      @total_count += 1
      result
  end

  def percentage_good
    # Returns as an integer the percentage of texts checked so far that passed
    # the check defined in the `check` method. The number 55 represents 55%.

    # counter of tests passing
    
    # counter of total tests

    if @total_count == 0
      return 0.0
    else
      return (@pass_count.to_f / @total_count.to_f) * 100.0
    end
  end
end