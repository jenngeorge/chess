require_relative 'player'
require_relative 'display'

class HumanPlayer < Player
  def initialize(display = Display.new, color=:black, name="HUUUMAN")
    super
  end

  def make_move
    @display.make_moves 
  end

  def give_prompt
    puts "Hello Human lol. Select which piece you would like to move"

  end


end
