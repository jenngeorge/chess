require 'singleton'

class NullPiece
  include Singleton

  def moves
    @moves
  end

  def color
    @color
  end

  def type
    :null
  end
  
  def to_s
    "   "
  end

  def empty?
    true
  end

end
