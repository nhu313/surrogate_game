class Rules
  def initialize(board)
    @board = board
  end

  def tied?
    !winner && @board.filled?
  end

  def winner
    @board.unique_marked_values.detect {|p| win?(p)}
  end

  private
  def win?(player)
    square_sets.any? do |squares|
      squares.all? {|square| square == player}
    end
  end

  def square_sets
    @board.rows + @board.columns + @board.diagonals
  end
end
