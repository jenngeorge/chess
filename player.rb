require_relative 'display'

class Player

  attr_reader :color

  def initialize(display, color, name)
    @display = display
    @color = color
    @name = name
  end

end
