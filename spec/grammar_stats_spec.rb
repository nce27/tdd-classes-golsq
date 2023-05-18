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
end