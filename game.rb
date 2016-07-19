require "require_all"
require_all "pieces"
require_all "."

if __FILE__ == $PROGRAM_NAME
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

  king = King.new(type=nil, color=:black, location=[0,0], b)
  p "king moves"
  p king.moves(king.move_dirs, king.directions)

  knight = Knight.new(type=nil, color=:black, location=[3, 3], b)
  p "knight moves"
  p knight.moves(knight.move_dirs, knight.directions)
end
