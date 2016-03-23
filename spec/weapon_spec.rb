require 'weapon'

RSpec::Matchers.define :beat do |other|
  match do |weapon|
    weapon.beats? other
  end
end

describe Weapon do
  describe 'class' do
    it 'supports Enumerable features over created weapons' do
      expect(Weapon).to include(Weapon.to_a.sample)
    end

    it 'allows selection of weapon by name' do
      expect(Weapon['Rock']).to be Weapon.rock
    end

    it 'returns nil for an invalid weapon name' do
      expect(Weapon[:tomato]).not_to be
    end
  end

  describe Weapon.rock do
    it { is_expected.to beat(Weapon.scissors) }
    it { is_expected.to beat(Weapon.lizard) }
    it { is_expected.not_to beat(Weapon.paper) }
    it { is_expected.not_to beat(Weapon.spock) }
  end

  describe Weapon.paper do
    it { is_expected.to beat(Weapon.rock) }
    it { is_expected.to beat(Weapon.spock) }
    it { is_expected.not_to beat(Weapon.scissors) }
    it { is_expected.not_to beat(Weapon.lizard) }
  end

  describe Weapon.scissors do
    it { is_expected.to beat(Weapon.paper) }
    it { is_expected.to beat(Weapon.lizard) }
    it { is_expected.not_to beat(Weapon.rock) }
    it { is_expected.not_to beat(Weapon.spock) }
  end

  describe Weapon.lizard do
    it { is_expected.to beat(Weapon.paper) }
    it { is_expected.to beat(Weapon.spock) }
    it { is_expected.not_to beat(Weapon.rock) }
    it { is_expected.not_to beat(Weapon.scissors) }
  end

  describe Weapon.spock do
    it { is_expected.to beat(Weapon.rock) }
    it { is_expected.to beat(Weapon.scissors) }
    it { is_expected.not_to beat(Weapon.paper) }
    it { is_expected.not_to beat(Weapon.lizard) }
  end
end
