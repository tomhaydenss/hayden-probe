RSpec.describe Hayden::Probe::Core::MoveEvaluator do

  describe '.eval' do

    let(:coordinate) { build(:coordinate) }
    let(:direction) { build(:direction) }
    let(:probe) { Hayden::Probe::Core::Probe.new(coordinate, direction) }

    subject { DummyEvaluator.new.eval(probe, move) }

    context 'when a probe direction is North and move Left' do
      let(:direction) { :n }
      let(:move) { :l }
      it { expect(subject.direction).to eq(:w) }
    end

    context 'when a probe direction is North and move Right' do
      let(:direction) { :n }
      let(:move) { :r }
      it { expect(subject.direction).to eq(:e) }
    end

    context 'when a probe direction is South and move Left' do
      let(:direction) { :s }
      let(:move) { :l }
      it { expect(subject.direction).to eq(:e) }
    end

    context 'when a probe direction is South and move Right' do
      let(:direction) { :s }
      let(:move) { :r }
      it { expect(subject.direction).to eq(:w) }
    end

    context 'when a probe direction is East and move Left' do
      let(:direction) { :e }
      let(:move) { :l }
      it { expect(subject.direction).to eq(:n) }
    end

    context 'when a probe direction is East and move Right' do
      let(:direction) { :e }
      let(:move) { :r }
      it { expect(subject.direction).to eq(:s) }
    end

    context 'when a probe direction is West and move Left' do
      let(:direction) { :w }
      let(:move) { :l }
      it { expect(subject.direction).to eq(:s) }
    end

    context 'when a probe direction is West and move Right' do
      let(:direction) { :w }
      let(:move) { :r }
      it { expect(subject.direction).to eq(:n) }
    end
  end

end

class DummyEvaluator
  include Hayden::Probe::Core::MoveEvaluator
end