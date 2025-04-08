require_relative "role"

class Codemaker < Role
  def initialize(player_type)
    super
    @role_name = "Code-Maker"
    @code = []
  end

  def play_turn(board_row_array)
    if @player_type == "human"
      give_feedback_human
    elsif @player_type == "computer"
      give_feedback_computer(board_row_array[0])
    end
  end

  def create_code
    @code = []
    if @player_type == "human"
      @code = %w[R G B Y]
    elsif @player_type == "computer"
      Game::SLOTS.times do
        @code.push(Role::VALID_GUESSES[0...6].sample[0])
      end
    end
    # p @code
  end

  def give_feedback_human
    puts "Give feedback to the last guess: #{VALID_FEEDBACK}"
    obtain_valid_input(VALID_FEEDBACK)
  end

  def give_feedback_computer(guess)
    feedback = Array.new(Game::SLOTS, "-")
    used_index = []
    splitted_guess = guess.split
    splitted_guess.each_with_index do |guess_element, guess_index|
      if guess_element == @code[guess_index]
        feedback[guess_index] = "C"
        used_index.push(guess_index)
      end
    end
    splitted_guess.each_with_index do |guess_element, guess_index|
      next if feedback[guess_index] == "C"

      @code.each_with_index do |code_element, code_index|
        next unless guess_element == code_element && code_index != guess_index && !used_index.include?(code_index)

        feedback[guess_index] = "P"
        used_index.push(code_index)
        break
      end
    end
    feedback.join(" ")
  end
end
