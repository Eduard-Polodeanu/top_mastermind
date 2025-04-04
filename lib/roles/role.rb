class Role
  attr_reader :role_name

  def initialize
  end

  def play_turn
    input = gets.chomp
    validated_input(input)
  end

  def validated_input(input)
    input
  end
end
