require_relative 'piece'
require "byebug"
module StepPiece

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
      delta = DIRECTIONS[move_dir]
      next_x = @location[0] + delta[0]
      next_y = @location[1] + delta[1]
      next_pos = [next_x, next_y]
      moves_arr << next_pos if valid_next_move?(next_pos)
    end

    moves_arr
  end

  def valid_next_move?(next_pos)
    @board.in_bounds?(next_pos) && @board[next_pos].is_a?(NullPiece)
  end
end #class end
