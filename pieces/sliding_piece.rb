require_relative "piece"
require "byebug"
module SlidingPiece

  DIRECTIONS = {
    :up => [-1, 0],
    :down => [1, 0],
    :left => [0, -1],
    :right => [0, 1],
    :left_up => [-1, -1],
    :right_up => [-1, 1],
    :left_down => [1, -1],
    :right_down => [1, 1]
  }
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
