require 'grammar_stats'

RSpec.describe GrammarStats do
  describe "#check" do

    context "when given an empty string" do
      it "fails" do
        grammar = GrammarStats.new
        expect { grammar.check("") }.to raise_error "Cannot check an empty string"
      end
    end  

      it "returns true if it is a valid sentence." do
        grammar = GrammarStats.new
        expect(grammar.check("Hello world.")).to eq true
      end
  end

  describe "#percentage_good" do
    it "Tests multiple sentences to see if it is valid" do
      grammar = GrammarStats.new
      grammar.check("hello world.") # => false
      grammar.check("Hello world!") # => true
      grammar.check("Hello world?") # => true
      grammar.check("Hello world") # => false
      expect(grammar.percentage_good).to eq(50)
      
    end
  end
end