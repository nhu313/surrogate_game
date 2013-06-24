require 'game/game'
require 'game/rules'
require 'mock/rules'

describe Game do

  it "checks if MockRules is substitutable for rules" do
    MockRules.should be_substitutable_for(Rules)
  end

  it "is over when there is a winner" do
    rules = MockRules.factory(winner: "winner")
    game = Game.new(rules)
    game.should be_over
    rules.was_not asked_for :tied?
  end

  it "is over when the game is tied" do
    rules = MockRules.factory(tied?: true)  #1. Create mock class with specified behavior
    game = Game.new(rules)                  #2. Create a game class 3. "Set" mock to game
    game.should be_over                     #4. Call method under test and 5. Verify expected behavior
    rules.was asked_for :winner             #5. Verify expected behavior
  end

  #another way to set mock behavior
  it "is over when game is tied" do
    rules = MockRules.factory
    rules.will_tied? true, false #set rules.tied? to true and false on the second call
    game = Game.new(rules)

    game.should be_over         #1st call is true
    game.should_not be_over     #2nd call is false
  end

  it "is not over when there is no winner and the game is not tied" do
    game = Game.new(MockRules.new) #another way to create the mock
    game.should_not be_over
  end

  #example of test with parameter
  it "is true when asks if player is the winner and rules says yes" do
    player = "player X"
    rules = MockRules.factory
    rules.will_have_winner?(player)
    game = Game.new(rules)
    game.winner?(player).should be_true
  end

end
