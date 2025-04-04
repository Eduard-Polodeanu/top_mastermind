require_relative "role"

class Codebreaker < Role
  def initialize
    super
    @role_name = "Code-Breaker"
  end

  def play_turn
    puts "Make your guess: [RED GREEN BLUE YELLOW BROWN PINK]"
    super
  end
end
