class GrammarStats
  def initialize
    @check = true
  end

  def check(text) # text is a string
    # Returns true or false depending on whether the text begins with a capital
    # letter and ends with a sentence-ending punctuation mark.
    first_char = text[0] #first letter of the text"
    last_char = text[-1]

    ends_with_punctuation = last_char.match? (/[.!?]/)
    starts_with_capital = first_char.match? (/[A-Z]/)

    starts_with_capital && ends_with_punctuation

    # valid_punctuation = (".", "!", "?")
    # last_char.include? valid_punctuation


  end

  def percentage_good
    # Returns as an integer the percentage of texts checked so far that passed
    # the check defined in the `check` method. The number 55 represents 55%.
  end
end