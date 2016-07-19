require_relative 'board'
require_relative 'display'
require_relative 'cursorable'
require_relative 'pieces/rook'
require_relative 'pieces/null_piece'
require_relative 'pieces/piece'
require_relative 'pieces/rook'
require_relative 'pieces/sliding_piece'
require_relative 'pieces/bishop'
require_relative 'pieces/queen'
require_relative 'pieces/king'
# Dir[File.dirname(__FILE__) + '/chess/pieces/*.rb'].each {|file| require file }

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
  p king.moves(king.move_dirs)
end
