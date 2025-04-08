class Player
  attr_accessor :role

  def initialize(name, role)
    @name = name
    @role = role
  end

  def play_turn(board_row_array)
    puts "#{@name} (#{@role.role_name}) it's your turn."
    @role.play_turn(board_row_array)
  end
end
