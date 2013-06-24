class Game

  def initialize(rules)
    @rules = rules
  end

  def over?
    return true if @rules.winner
    return true if @rules.tied
    return false
  end
end
