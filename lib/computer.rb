require_relative 'game'

class Computer
  attr_reader :choice

  def initialize
    @choice = Game.moves.sample
  end
end