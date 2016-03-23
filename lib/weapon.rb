#Understands the rules of Rock, Paper, Scissors

class Weapon
  class << self
    include Enumerable

    def each(&block)
      weapons.values.each(&block)
    end

    def [](name)
      weapons[name]
    end

    private

    def weapons
      @weapons ||= {}
    end
  end

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
    self.class.singleton_class.class_eval do
      define_method name do
        instance
      end
    end
  end

  def self.create(name, beats = [], loses_to = [])
    weapon = Weapon.new(name, *beats)
    weapons.store(name.to_sym, weapon)
    if loses_to.is_a?(Weapon)
      loses_to.send(:beats, weapon)
    else
      loses_to.each { |other| other.send(:beats, weapon) }
    end
    weapon
  end

  rock = create(:rock)
  paper = create(:paper, rock)
  scissors = create(:scissors, paper, rock)
  lizard = create(:lizard, paper, [rock, scissors])
  create(:spock, [scissors, rock], [lizard, paper])
end
