require 'player'

describe Player do
  subject(:player) { Player.new }
  let(:weapon) { double :weapon }

  before do
    player.choose(weapon)
  end

  it 'can choose a weapon' do
    expect(player.weapon).to be weapon
  end

  describe 'vs another player' do
    let(:other_player) { Player.new }

    it 'can win' do
      other_weapon = double :weapon
      other_player.choose(other_weapon)
      allow(weapon).to receive(:beats?).with(other_weapon).and_return(true)
      expect(player.vs(other_player)).to eq :win
    end

    it 'can draw' do
      other_player.choose(weapon)
      expect(player.vs(other_player)).to eq :draw
    end

    it 'can lose' do
      other_weapon = double :weapon
      other_player.choose(other_weapon)
      allow(weapon).to receive(:beats?).with(other_weapon).and_return(false)
      expect(player.vs(other_player)).to eq :lose
    end
  end
end
