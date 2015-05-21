require 'game'

describe Game do
  describe 'moves' do
    it 'returns the allowed moves' do
      expect(Game.moves.count).to eq 3
      [:rock, :paper, :scissors].each do |move|
        expect(Game.moves).to include move
      end
    end
  end
end