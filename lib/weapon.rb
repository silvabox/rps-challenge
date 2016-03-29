class Weapon
  def initialize(name, *beats)
    @beats = beats
    @name = name.to_s
    define_helper(name)
  end

  def beats?(other)
    @beats.include?(other)
  end

  def to_s
    @name.capitalize
  end

  def inspect
    to_s
  end

  private

  def beats(other)
    @beats << other
  end

  def define_helper(name)
    instance = self
    self.class.define_singleton_method name do
      instance
    end
  end

  class << self
    include Enumerable

    def each(&block)
      weapons.values.each(&block)
    end

    def [](name)
      weapons[name.to_s.downcase.to_sym]
    end

    def all
      @weapons.values
    end

    def create(name, beats = [], loses_to = [])
      weapon = Weapon.new(name, *beats)
      weapons.store(name.to_sym, weapon)
      assign_loses_to(weapon, *loses_to)
      weapon
    end

    private

    def weapons
      @weapons ||= {}
    end

    def assign_loses_to(weapon, *loses_to)
      loses_to.each { |other| other.send(:beats, weapon) }
    end
  end

  rock = create(:rock)
  paper = create(:paper, rock)
  scissors = create(:scissors, paper, rock)
  lizard = create(:lizard, paper, [rock, scissors])
  create(:spock, [scissors, rock], [lizard, paper])
end
