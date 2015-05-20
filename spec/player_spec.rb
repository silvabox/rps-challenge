require 'player'

describe Player do
  it 'can choose rock' do
    subject.choose 'rock'
    expect(subject.choice).to eq :rock
  end
  it 'can choose paper' do
    subject.choose 'paper'
    expect(subject.choice).to eq :paper
  end
  it 'can choose scissors' do
    subject.choose 'scissors'
    expect(subject.choice).to eq :scissors
  end

  context 'Rock' do
    before { subject.choose :rock }
    context 'vs Rock' do
      it 'draws' do
        expect(subject.vs double :computer, choice: :rock).to eq :draw
      end
    end
    context 'vs Paper' do
      it 'loses' do
        expect(subject.vs double :computer, choice: :paper).to eq :lose
      end
    end
    context 'vs Scissors' do
      it 'wins' do
        expect(subject.vs double :computer, choice: :scissors).to eq :win
      end
    end
  end

  context 'Paper' do
    before { subject.choose :paper }
    context 'vs Rock' do
      it 'wins' do
        expect(subject.vs double :computer, choice: :rock).to eq :win
      end
    end
    context 'vs Paper' do
      it 'draws' do
        expect(subject.vs double :computer, choice: :paper).to eq :draw
      end
    end
    context 'vs Scissors' do
      it 'loses' do
        expect(subject.vs double :computer, choice: :scissors).to eq :lose
      end
    end
  end

  context 'Scissors' do
    before { subject.choose :scissors }
    context 'vs Rock' do
      it 'loses' do
        expect(subject.vs double :computer, choice: :rock).to eq :lose
      end
    end
    context 'vs Paper' do
      it 'wins' do
        expect(subject.vs double :computer, choice: :paper).to eq :win
      end
    end
    context 'vs Scissors' do
      it 'draws' do
        expect(subject.vs double :computer, choice: :scissors).to eq :draw
      end
    end
  end
end