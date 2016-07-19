require_relative "../board"

class Piece

  attr_reader :DIRECTIONS

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

  attr_reader :color
  attr_accessor :location

  def initialize(type=nil, color=:black, location=[0,0], board=Board.new)
    @color=color
    @type = type
    @location = location
    @board = board
  end

  def moves
  end

end
