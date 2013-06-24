require 'game/game'
require 'mock/rules'
require 'game/rules'
describe Game do

  before(:each) do
    @rules = MockRules.new
    @game = Game.new(@rules)
  end

  it "checks if MockRules is substitutable for rules" do
    MockRules.should be_substitutable_for(Rules)
  end

  it "is over when there is a winner" do

  end

  it "is over when the game is tied" do

  end

  it "is not over when there is no winner and the game is not tied" do

  end

end
