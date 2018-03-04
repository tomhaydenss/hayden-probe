RSpec.describe Hayden::Probe::Core::MoveEvaluator do

  describe '.eval' do

    let(:coordinate) { build(:coordinate) }
    let(:direction) { build(:direction) }
    let(:move) { :m }
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

    context 'when a probe direction is North and move Forward' do
      let(:direction) { :n }
      it { expect(subject.direction).to eq(direction) }
      it { expect(subject.coordinate.x).to eq(coordinate.x) }
      it { expect(subject.coordinate.y).to eq(coordinate.y + 1) }
    end

    context 'when a probe direction is South and move Forward' do
      let(:direction) { :s }
      it { expect(subject.direction).to eq(direction) }
      it { expect(subject.coordinate.x).to eq(coordinate.x) }
      it { expect(subject.coordinate.y).to eq(coordinate.y - 1) }
    end

    context 'when a probe direction is East and move Forward' do
      let(:direction) { :e }
      it { expect(subject.direction).to eq(direction) }
      it { expect(subject.coordinate.x).to eq(coordinate.x + 1) }
      it { expect(subject.coordinate.y).to eq(coordinate.y) }
    end

    context 'when a probe direction is Weast and move Forward' do
      let(:direction) { :w }
      it { expect(subject.direction).to eq(direction) }
      it { expect(subject.coordinate.x).to eq(coordinate.x - 1) }
      it { expect(subject.coordinate.y).to eq(coordinate.y) }
    end

  end

end

class DummyEvaluator
  include Hayden::Probe::Core::MoveEvaluator
end