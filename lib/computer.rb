require_relative 'weapon'

class Computer
  def initialize(weapons = Weapon.to_a)
    @weapons = weapons
  end

  def choose
    @weapon = @weapons.sample
  end

  def weapon
    @weapon ||= choose
  end
end
