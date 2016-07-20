require_relative "piece"
require_relative 'step_piece'

class Pawn < Piece
  include StepPiece
  attr_reader :board, :directions

  def initialize(type=:pawn, color=:black, location=[0,0], board=Board.new)
    super
  end

  def move_dirs
    return [-1, 0] if @color == :black
    return [1, 0] if @color == :white
  end

  def attack_move_dirs
    [:left_up, :left_down, :right_up, :right_down]
  end

  def at_start_row?
    return true if @color == :black && @location[0] == 6
    return true if @color == :white && @location[0] == 1
    false
  end


  def moves(move_dirs)
    possible_moves = []
    number_steps = 1

    if at_start_row?
      puts "1 or 2 steps?"
      number_steps = gets.chomp.to_i
    end
    # byebug
    x = @location[0] + move_dirs[0]
    y = @location[1] + move_dirs[1]
    possible_moves << [x, y]

    if number_steps == 2
      x = x + move_dirs[0]
      y = y + move_dirs[1]
      possible_moves << [x, y]
    end

    possible_moves
  end

  def attack_move
  end


end
