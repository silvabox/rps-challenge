class Player

  attr_reader :weapon

  def choose weapon
    @weapon = weapon
  end

  def vs other
    return :draw if @weapon == other.weapon
    @weapon.beats?(other.weapon) ? :win : :lose
  end
end
