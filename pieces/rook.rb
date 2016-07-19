require_relative "piece"
require_relative 'sliding_piece'

class Rook < Piece
  include SlidingPiece

  attr_reader :board
  def initialize(type=:rook, color=:black, location=[0,0], board=Board.new)
    super
  end

  def move_dirs
    [:up, :down, :left, :right]
  end

end
