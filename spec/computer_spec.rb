require 'computer'

describe Computer do
  subject(:computer) { Computer.new(weapons) }
  let(:weapons) { double :weapons, sample: :random }

  it 'chooses a weapon at random' do
    expect(computer.weapon).to be :random
  end
end
