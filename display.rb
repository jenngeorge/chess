require_relative 'board'
require_relative 'cursorable'
require "colorize"
require "byebug"
class Display
  include Cursorable

  PIECE_SYMBOLS = {
    :king => " \u265A ",
    :queen => " \u265B ",
    :knight => " \u265E ",
    :pawn => " \u265F ",
    :rook => " \u265C ",
    :bishop => " \u265D ",
    :null => "   "
  }


  def initialize(board= Board.new)
    @board = board
    @cursor_pos = [0, 0]
    @selected = false
  end

  def render
    system("clear")
    @board.each_with_index do |row, row_idx|
      row.each_index do |col_idx|
        pos = [row_idx, col_idx]
        if @cursor_pos == pos
          print "#{PIECE_SYMBOLS[@board[pos].type].encode('UTF-8').colorize(:color => @board[pos].color, :background => :green)}"
        else
          if row_idx % 2 != col_idx % 2
            print "#{PIECE_SYMBOLS[@board[pos].type].encode('UTF-8').colorize(:color => @board[pos].color, :background => :blue)}"
          else
            print "#{PIECE_SYMBOLS[@board[pos].type].encode('UTF-8').colorize(:color => @board[pos].color, :background => :light_blue)}"
          end
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
      render
    end

    print @cursor_pos
  end
end
