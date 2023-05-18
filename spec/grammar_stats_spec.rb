require 'grammar_stats'

RSpec.describe GrammarStats do
  describe "#check" do
    it "returns true if it is a valid sentence." do
      stats = GrammarStats.new
      expect(stats.check("Hello world.")).to eq true
    end
  end
end