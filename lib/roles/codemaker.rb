require_relative "role"

class Codemaker < Role
  def initialize
    super
    @role_name = "Code-Maker"
  end

  def play_turn
    puts "Give feedback to the last guess: #{VALID_FEEDBACK}"
    obtain_valid_input(VALID_FEEDBACK)
  end

  def create_code
    %w[red green blue yellow]
  end
end
