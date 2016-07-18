require_relative 'piece'

class SlidingPiece < Piece
  def initialize
    super
  end

  #directions is an array of directions
  def moves(move_dirs)
    moves_arr = []
    move_dirs.each do |move_dir| #move_dir :up
      starting_location = @location
      delta = DIRECTIONS[move_dir]
      while @board.in_bounds?(starting_location) && (@board[starting_location].is_a?(NullPiece) || starting_location == @location )
        moves_arr << starting_location
        next_pos = starting_location.map { |el| el + next_pos[starting_location.index(el)]}
        starting_location = next_pos
      end
  end
end
