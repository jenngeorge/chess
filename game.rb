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
require_relative "player"
require_relative "human_player"
require_relative "computer_player"
require "colorize"

class Game
  attr_reader :display, :player1, :player2, :current_player

  def initialize(display = Display.new)
    @display = display
    @player1 = HumanPlayer.new(@display)
    @player2 = HumanPlayer.new(@display, :white, "homo sapien")
    @current_player = [player1, player2].sample
  end

  def play
    until game.won?
      display_board


    end
  end

  def display_board
    @display.render
  end

  def play_turn
    @current_player.make_move
    #ask for piece
    display.make_moves #gives selected cursor position of piece

    #ask where to move piece

  end

  def switch_players
    @current_player = (@current_player == @player1 ? @player2 : @player1)
  end

  def won?
    # checkmate logic
  end
end

if __FILE__ == $PROGRAM_NAME
  g = Game.new
  g.display_board
  g.display.make_moves
end
