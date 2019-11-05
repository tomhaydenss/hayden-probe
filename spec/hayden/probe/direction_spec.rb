RSpec.describe Hayden::Probe::Direction do
  describe '.new' do
    subject(:direction) { Hayden::Probe::Direction.new(orientation) }

    context 'when valid orientation is given' do
      let(:orientation) { build(:orientation) }

      it { expect(direction).not_to be nil }
      it { expect(direction.current).to eq(orientation) }
      it { expect(direction.to_s).to eq(orientation.to_s.upcase) }
    end

    context 'when valid orientation is not given' do
      let(:orientation) { :t }

      it { expect { direction }.to raise_error(Hayden::Probe::Errors::InvalidInputData) }
    end
  end

  describe '#next' do
    subject(:direction) { Hayden::Probe::Direction.new(orientation) }

    before { direction.next(move) }

    context 'when facing North and turn Left' do
      let(:orientation) { :n }
      let(:move) { :l }
      let(:expected) { :w }

      it { expect(direction.current).to eq(expected) }
      it { expect(direction.to_s).to eq(expected.to_s.upcase) }
    end

    context 'when facing North and turn Right' do
      let(:orientation) { :n }
      let(:move) { :r }
      let(:expected) { :e }

      it { expect(direction.current).to eq(expected) }
      it { expect(direction.to_s).to eq(expected.to_s.upcase) }
    end

    context 'when facing South and turn Left' do
      let(:orientation) { :s }
      let(:move) { :l }
      let(:expected) { :e }

      it { expect(direction.current).to eq(expected) }
      it { expect(direction.to_s).to eq(expected.to_s.upcase) }
    end

    context 'when facing South and turn Right' do
      let(:orientation) { :s }
      let(:move) { :r }
      let(:expected) { :w }

      it { expect(direction.current).to eq(expected) }
      it { expect(direction.to_s).to eq(expected.to_s.upcase) }
    end

    context 'when facing East and turn Left' do
      let(:orientation) { :e }
      let(:move) { :l }
      let(:expected) { :n }

      it { expect(direction.current).to eq(expected) }
      it { expect(direction.to_s).to eq(expected.to_s.upcase) }
    end

    context 'when facing East and turn Right' do
      let(:orientation) { :e }
      let(:move) { :r }
      let(:expected) { :s }

      it { expect(direction.current).to eq(expected) }
      it { expect(direction.to_s).to eq(expected.to_s.upcase) }
    end

    context 'when facing West and turn Left' do
      let(:orientation) { :w }
      let(:move) { :l }
      let(:expected) { :s }

      it { expect(direction.current).to eq(expected) }
      it { expect(direction.to_s).to eq(expected.to_s.upcase) }
    end

    context 'when facing West and turn Right' do
      let(:orientation) { :w }
      let(:move) { :r }
      let(:expected) { :n }

      it { expect(direction.current).to eq(expected) }
      it { expect(direction.to_s).to eq(expected.to_s.upcase) }
    end
  end

  context 'when a invalid move is given' do
    let(:orientation) { :w }
    let(:move) { :invalid_move }

    subject { Hayden::Probe::Direction.new(orientation).next(move) }

    it { expect { subject }.to raise_error(Hayden::Probe::Errors::InvalidInputData) }
  end
end
