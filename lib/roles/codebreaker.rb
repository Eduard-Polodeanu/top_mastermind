require_relative "role"

class Codebreaker < Role
  def initialize(player_type)
    super
    @role_name = "Code-Breaker"
  end

  def play_turn(board_row_array)
    if @player_type == "human"
      make_guess_human
    elsif @player_type == "computer"
      make_guess_computer(board_row_array)
    end
  end

  def make_guess_human
    puts "Make your guess: #{VALID_GUESSES}"
    obtain_valid_input(VALID_GUESSES)
  end

  def make_guess_computer(board_row_array)
  end
end
