require "sliding_piece"

class Rook < SlidingPiece
  def initialize
    super(:rook)
  end

  def move_dirs
    [:up, :down, :left, :right]
  end
  
end
