class Computer
  attr_accessor :choice

  # def initialize
  #   @choice = Game.moves.sample
  # end

  def choice
    @choice = [:rock, :paper, :scissors].sample
  end
end