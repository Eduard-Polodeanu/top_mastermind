require_relative "board"
require_relative "player"
require_relative "roles/codebreaker"
require_relative "roles/codemaker"

class Game
  def initialize
    puts "New game"
    @players = [Player.new("Player1", Codebreaker.new), Player.new("Player2", Codemaker.new)]
    p @players
    @board = Board.new
  end
end
