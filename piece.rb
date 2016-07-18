class Piece

  attr_reader :color

  def initialize(type=nil,color=black)
    @color=color
    @type = type
  end

  def moves
  end

end
