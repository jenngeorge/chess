require_relative "piece"
require_relative 'step_piece'

class King < Piece
  include StepPiece
  attr_reader :board

  def initialize(type='king', color=:black, location=[0,0], board=Board.new)
    super
  end

  def move_dirs
    [:left_up, :left_down, :right_up, :right_down, :left, :up, :down, :right]
  end

end
