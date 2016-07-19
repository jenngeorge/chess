require_relative 'piece'
require "byebug"
class SlidingPiece < Piece
  def initialize(type=nil, color=:black, location=[0,0], board=Board.new)
    super
  end

  #directions is an array of directions
  def moves(move_dirs)
    moves_arr = []
    move_dirs.each do |move_dir| #move_dir :up
      starting_location = @location
      delta = DIRECTIONS[move_dir]
      while @board.in_bounds?(starting_location) && check_location?(starting_location)
        # byebug
        moves_arr << starting_location unless starting_location == @location
        next_x = starting_location[0] + delta[0]
        next_y = starting_location[1] + delta[1]
        next_pos = [next_x, next_y]
        starting_location = next_pos
      end
    end

    moves_arr
  end

  def check_location?(starting_location)
    @board[starting_location].empty? || starting_location == @location
  end

end #class end
