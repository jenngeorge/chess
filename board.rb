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
    set_pawn_row(:white)
    set_pawn_row(:black)
    set_royal_row(:white)
    set_royal_row(:black)
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

  def set_royal_row(color)
    if color == :black
      row_to_pawnify = 7
    else
      row_to_pawnify = 0
    end
    @grid[row_to_pawnify][0] = Rook.new(:rook, color, [row_to_pawnify, 0], self)
    @grid[row_to_pawnify][1] = Knight.new(:knight, color, [row_to_pawnify, 1], self)
    @grid[row_to_pawnify][2] = Bishop.new(:bishop, color, [row_to_pawnify, 2], self)
    @grid[row_to_pawnify][3] = King.new(:king, color, [row_to_pawnify, 3], self)
    @grid[row_to_pawnify][4] = Queen.new(:queen, color, [row_to_pawnify, 4], self)
    @grid[row_to_pawnify][5] = Bishop.new(:bishop, color, [row_to_pawnify, 5], self)
    @grid[row_to_pawnify][6] = Knight.new(:knight, color, [row_to_pawnify, 6], self)
    @grid[row_to_pawnify][7] = Rook.new(:rook, color, [row_to_pawnify, 7], self)
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
