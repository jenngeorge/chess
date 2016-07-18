class Piece

  DIRECTIONS = {
    :up => [x-1, y],
    :down => [x+1, y],
    :left => [x, y-1],
    :right => [x, y+1],
    :left_up => [x-1, y-1],
    :right_up => [x-1, y+1],
    :left_down => [x+1, y-1],
    :right_down => [x+1, y+1]
  }

  attr_reader :color
  attr_accessor :location

  def initialize(type=nil, color=black, location=[0,0], board=Board.new)
    @color=color
    @type = type
    @location = location
    @board = board
  end

  def moves
  end

end
