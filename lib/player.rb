require_relative "roles/role"

class Player
  def initialize(name, role)
    puts "New player"
    @name = name
    @role = role
  end
end
