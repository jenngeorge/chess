require_relative 'board'
require_relative 'cursorable'
require "colorize"
require "byebug"
class Display
  include Cursorable

  PIECE_SYMBOLS = {
    :king => "\u265A",
    :queen => "\u265B",
    :knight => "\u265E",
    :pawn => "\u265F",
    :rook => "\u265C",
    :bishop => "\u265D",
    :null => "   "
  }


  def initialize(board)
    @board = board
    @cursor_pos = [0, 0]
    @selected = false
  end

  def render
    @board.each_with_index do |row, row_idx|
      row.each_index do |col_idx|
        pos = [row_idx, col_idx]
        if @cursor_pos == pos
          print @board[pos].to_s.colorize(:background => :green)
        end
        unless @board[pos].is_a?(NullPiece)
          print " #{PIECE_SYMBOLS[@board[pos].type].encode('UTF-8').colorize(@board[pos].color)} "
        end
      end
      puts
    end


  end

  def make_moves
    until @selected
      get_input
      render
      puts "getting input"
      @selected = true unless get_input.nil?
    end

    print @cursor_pos
  end
end
