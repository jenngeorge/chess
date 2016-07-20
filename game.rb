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
require 'byebug'

class Game
  attr_reader :display, :player1, :player2, :current_player, :board

  def initialize(board=Board.new)
    @board = board
    @display = Display.new(@board)
    @player1 = HumanPlayer.new(@display)
    @player2 = HumanPlayer.new(@display, :white, "homo sapien")
    @current_player = player1 #[player1, player2].sample
  end

  def play
    display_board
    until won?
      play_turn
      switch_players
      display_board
    end
  end

  def declare_player
    puts "It is #{@current_player.name}'s turn. Good luck!"
  end

  def play_turn
    declare_player
    selected_piece = select_piece
    move_piece(selected_piece)
  end


  def display_board
    @display.render
  end

  def select_piece
    #ask for piece
    valid = false
    until valid
      p "select your piece"
      pos_selected = @current_player.make_move
      valid = valid_pos?(pos_selected)
    end
    puts "you selected at #{pos_selected}"
    pos_selected
  end

  def move_piece(selected_location)
    puts "You selected a #{@board[selected_location].type}. "
    valid = false
    until valid
      display_board
      p "Where do you want to move it?"
      move_selected = @current_player.make_move

      selected_object = @board[selected_location]
      selected_object_valid_moves = selected_object.move_dirs
      valid = selected_object.moves(selected_object_valid_moves).include?(move_selected)
    end
    # byebug
    puts "you moved to #{move_selected}"
    @board[move_selected] = selected_object
    @board[selected_location] = NullPiece.instance
    selected_object.location = move_selected
  end


  def valid_pos?(pos_selected)
    # byebug
    pos_object = @board[pos_selected]
    if pos_object.is_a?(NullPiece) || (pos_object.color != @current_player.color)
      return false
    else
      true
    end
  end


  def switch_players
    @current_player = (@current_player == @player1 ? @player2 : @player1)
  end

  def won?
    @board.each_with_index do |row, row_idx|
      row.each do |object|
        return false if object.is_a?(King) && object.color == @current_player.color
      end
    end

    puts "you won you won you won! let's party."
    true
  end
end

if __FILE__ == $PROGRAM_NAME
  g = Game.new
  g.display_board
  g.play
end
