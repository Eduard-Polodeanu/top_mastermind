require_relative "board"
require_relative "player"
require_relative "roles/codebreaker"
require_relative "roles/codemaker"

class Game
  ATTEMPTS = 8
  SLOTS = 4
  def initialize
    @players = [Player.new("Player1", Codebreaker.new("human")), Player.new("Player2", Codemaker.new("computer"))]
    @board = Board.new(ATTEMPTS)
    start_game
  end

  def start_game
    start_round(@players)
  end

  def start_round(players)
    puts "\n\n---New round---\nRules: #{ATTEMPTS} attempts, 6 colors, #{SLOTS} slots"
    players[1].role.create_code
    @board.show_board
    (0...ATTEMPTS).each do |index_attempt|
      players.each_with_index do |player, index_player|
        input = player.play_turn(@board.rows[index_attempt])
        @board.add_attempt_to_board(input, index_attempt, index_player)
        @board.show_board
      end
      if @board.game_win?(@board.rows[index_attempt])
        puts "You won!"
        break
      end
    end
  end
end
