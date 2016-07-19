require_relative 'board'
require_relative 'cursorable'
require "colorize"
require "byebug"
class Display
  include Cursorable

  def initialize(board)
    @board = board
    @cursor_pos = [0, 0]
    @selected = false
  end

  def render
    @board.each_with_index do |row, row_idx|
      row.each_index do |col_idx|
        pos = [row_idx, col_idx]
        @cursor_pos == pos ? (print @board[pos].to_s.colorize(:background => :green)) : (print @board[pos].to_s)
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
