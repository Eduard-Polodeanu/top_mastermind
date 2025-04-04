require_relative "board"
require_relative "player"
require_relative "roles/codebreaker"
require_relative "roles/codemaker"

class Game
  ATTEMPTS = 3
  def initialize
    @players = [Player.new("Player1", Codebreaker.new), Player.new("Player2", Codemaker.new)]
    @board = Board.new(ATTEMPTS)
    start_game
  end

  def start_game
    start_round(@players)
  end

  def start_round(players)
    puts "\n\n---New round---\nRules: #{ATTEMPTS} attempts, 6 colors, 4 slots"
    @board.code = players[1].role.create_code
    @board.show_board
    (0...ATTEMPTS).each do |index_attempt|
      players.each_with_index do |player, index_player|
        input = player.play_turn
        @board.add_attempt_to_board(input, index_attempt, index_player)
        @board.show_board
      end
    end
  end
end
