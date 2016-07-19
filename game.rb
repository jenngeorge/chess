require_relative "display"
require_relative "board"
require_relative "cursorable"
require_relative "pieces/bishop"
require_relative "pieces/king"
require_relative "pieces/knight"
require_relative "pieces/null_piece"
require_relative "pieces/pawn"
require_relative "pieces/piece"
require_relative "pieces/queen"
require_relative "pieces/rook"
require_relative "pieces/sliding_piece"
require_relative "pieces/step_piece"
require "colorize"

class Game
  def initialize(board = Board.new, player1 = HumanPlayer.new, player2 = ComputerPlayer.new)
    @board = board
    @player1 = player1
    @player2 = player2
  end

  
end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  b.populate_grid
  d = Display.new(b)
  b.set_pieces
  puts
  d.render
end
