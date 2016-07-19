require_relative 'player'

class HumanPlayer < Player
  def initialize(color=:black, name="HUUUMAN")
    super
  end

  def make_move
    give_prompt
  end

  def give_prompt
    puts "Hello Human lol. Select which piece you would like to move"

  end

  
end
