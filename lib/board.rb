require_relative "roles/codemaker"

class Board
  attr_accessor :code, :rows

  def initialize(attempts)
    @rows = Array.new(attempts) { ["- - - -", "- - - -"] }
  end

  def show_board
    puts "\nCurrent board:"
    puts "_____________________"
    @rows.each do |row|
      puts "| #{row[0]} | #{row[1]} |"
    end
    puts "\u203E\u203E\u203E\u203E\u203E\u203E\u203E\u203E\u203E\u203E\u203E\u203E\u203E\u203E\u203E\u203E\u203E\u203E\u203E\u203E\u203E"
  end

  def add_attempt_to_board(attempt, row, column)
    @rows[row][column] = attempt
  end

  def game_win?(row)
    row[1].eql?("C C C C")
  end
end
