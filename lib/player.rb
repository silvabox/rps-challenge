require_relative 'game'

class Player

  attr_reader :choice

  def choose val
    @choice = val.downcase.to_sym
  end

  def vs other
    fail 'Invalid choice' unless Game::RULES[@choice]
    Game::RULES[@choice][other.choice]
  end
end