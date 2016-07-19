require "require_all"
require_all "pieces"

class Board
  include Enumerable
  attr_reader :grid

  def initialize
    @grid = Array.new(8) {Array.new(8)}
  end

  #update 2d grid and moved piece's position
  #raise an exception if: (a) there is no piece at start or (b) the piece cannot move to end_pos.
  def move(start, end_pos)
  end

  #TODO: add in starting pieces
  def populate_grid
    @grid.each_with_index do |row, row_idx|
      row.each_index do |col_idx|
        pos = [row_idx, col_idx]
        self[pos] = NullPiece.instance
      end
    end
  end

  def set_pieces

  end


  def set_pawn_row(color)
    if color == :black
      row_to_pawnify = 6
    else
      row_to_pawnify = 1
    end

    (0..7).each do |col|
      @grid[row_to_pawnify][col] = Pawn.new(:pawn, color, [row_to_pawnify, col], self)
    end
  end

  def set_royal_row

  end

  def each(&prc)
    @grid.each {|row| prc.call(row)}
  end

  def []=(pos, value)
    x, y = pos
    @grid[x][y] = value
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def in_bounds?(pos)
    pos.all? {|el| (0...8).include?(el)}
  end

end
