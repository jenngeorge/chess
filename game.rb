require_relative "display"
require_relative "board"
require_relative "cursorable"
require_relative "pieces/bishop"
require_relative "pieces/king"
require_relative "pieces/knight"
require_relative "pieces/null_piece"
require_relative "pieces/pawn"
require_relative "pieces/piece"
require_relative "pieces/queen"
require_relative "pieces/rook"
require_relative "pieces/sliding_piece"
require_relative "pieces/step_piece"
require "colorize"

if __FILE__ == $PROGRAM_NAME
  @unicode = "\u265A"
  puts "#{@unicode.encode('UTF-8').colorize(:red)}"


  b = Board.new
  b.populate_grid
  d = Display.new(b)
  p d.render
  d.make_moves
  r = Rook.new(type=nil, color=:black, location=[0,0], b)
  p r.moves(r.move_dirs)

  bishop = Bishop.new(type=nil, color=:black, location=[0,0], b)
  p "bishop moves"
  p bishop.moves(bishop.move_dirs)

  queen = Queen.new(type=nil, color=:black, location=[0,0], b)
  p "queen moves"
  p queen.moves(queen.move_dirs)

  knight = Knight.new(type=nil, color=:black, location=[3, 3], b)
  p "knight moves"
  p knight.moves(knight.move_dirs)

  # king = King.new(type=nil, color=:black, location=[0,0], b)
  # p "king moves"
  # p king.moves(king.move_dirs)



  pawn = Pawn.new(type=nil, color=:white, location=[1, 0], b)
  p "pawn moves"
  p pawn.step_moves
  b.set_pieces
  puts
  p d.render


end
