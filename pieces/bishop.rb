require_relative "sliding_piece"

class Bishop < SlidingPiece
  attr_reader :board
  def initialize(type='bishop', color=:black, location=[0,0], board=Board.new)
    super
  end

  def move_dirs
    [:left_up, :left_down, :right_up, :right_down]
  end

end
