class Role
  VALID_GUESSES = %w[RED GREEN BLUE YELLOW ORANGE PINK R G B Y O P].freeze
  VALID_FEEDBACK = %w[CORRECT PARTIAL WRONG C P W].freeze
  attr_reader :role_name

  def initialize(player_type)
    @role_name = "NOROLE"
    @player_type = player_type
  end

  def obtain_valid_input(allowed)
    loop do
      input = gets.chomp.upcase.split
      if has_invalid?(input, allowed) == false && input.length == Game::SLOTS
        input = input.map { |word| word[0] }
        return input.join(" ")
      end
      puts "Your input is invalid. Make sure to fill all slots, select only from the list above and separete the element by space."
    end
  end

  def has_invalid?(input, allowed)
    input.any? { |element| !allowed.include?(element) }
  end
end
