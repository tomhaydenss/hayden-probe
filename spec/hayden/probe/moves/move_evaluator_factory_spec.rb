RSpec.describe Hayden::Probe::Moves::MoveEvaluatorFactory do
  describe '.for' do
    let(:surface) { {} }
    let(:probe) { {} }

    subject { Hayden::Probe::Moves::MoveEvaluatorFactory.for(surface, probe, move) }

    context 'when turn move is given' do
      let(:move) { %i[l r].sample }

      it { expect(subject).to be_a_instance_of(Hayden::Probe::Moves::TurnMoveEvaluator) }
    end

    context 'when forward move is given' do
      let(:move) { :m }

      it { expect(subject).to be_a_instance_of(Hayden::Probe::Moves::ForwardMoveEvaluator) }
    end

    context 'when valid move is not given' do
      let(:move) { :invalid_move }

      it { expect { subject }.to raise_error(Hayden::Probe::Errors::InvalidInputData) }
    end
  end
end
  