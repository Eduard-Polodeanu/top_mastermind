require_relative "role"

class Codebreaker < Role
  def initialize
    super
    @role_name = "Code-Breaker"
  end

  def play_turn
    puts "Make your guess: #{VALID_GUESSES}"
    obtain_valid_input(VALID_GUESSES)
  end
end
