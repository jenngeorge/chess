require_relative "piece"
require_relative 'step_piece'

class Knight < Piece
  include StepPiece

  attr_reader :directions, :board


  def initialize(type='knight', color=:black, location=[0,0], board=Board.new)
    super
    @directions = {
      left_up: [-2, -1],
      right_up: [-2,  1],
      up: [-1, -2],
      right: [-1,  2],
      left: [ 1, -2],
      right_down: [ 1,  2],
      left_down: [ 2, -1],
      down: [ 2,  1]
    }
  end

  def move_dirs
    [:left_up, :left_down, :right_up, :right_down, :left, :up, :down, :right]
  end

end
