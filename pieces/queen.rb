require_relative "piece"
require_relative 'sliding_piece'

class Queen < Piece
  include SlidingPiece
  attr_reader :board
  def initialize(type='queen', color=:black, location=[0,0], board=Board.new)
    super
  end

  def move_dirs
    [:left_up, :left_down, :right_up, :right_down, :left, :up, :down, :right]
  end

end
