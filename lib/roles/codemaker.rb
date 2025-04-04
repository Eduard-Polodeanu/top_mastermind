require_relative "role"

class Codemaker < Role
  def initialize
    super
    @role_name = "Code-Maker"
  end

  def play_turn
    puts "Give feedback to the last guess: [EMPTY/PARTIAL/CORRECT]"
    super
  end

  def create_code
    %w[red green blue yellow]
  end
end
