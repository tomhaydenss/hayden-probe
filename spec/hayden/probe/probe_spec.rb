RSpec.describe Hayden::Probe::Probe do
  let(:position) { build(:position) }
  let(:direction) { build(:orientation) }
  let(:probe) { Hayden::Probe::Probe.new(position.x, position.y, direction) }

  describe '.new' do
    subject { probe }

    context 'when correct informations are given' do
      it { expect(subject).not_to be nil }
      it { expect(subject.position.x).to eq(position.x) }
      it { expect(subject.position.y).to eq(position.y) }
      it { expect(subject.direction.current).to eq(direction) }
      it { expect(subject.to_s).to eq("#{position.x} #{position.y} #{direction.to_s.upcase}") }
    end

    context 'when incorrect informations are given' do
      let(:direction) { :a }

      it { expect { probe }.to raise_error(Hayden::Probe::Errors::InvalidInputData) }
    end
  end

  describe '#update' do
    subject { probe.update(params) }

    context 'when updating position' do
      let(:params) { { x_axis: 77, y_axis: 77 } }

      it { expect(subject.position.x).to eq(77) }
      it { expect(subject.position.y).to eq(77) }
    end

    context 'when updating direction' do
      let(:params) { { direction: :w } }

      it { expect(subject.direction.current).to eq(:w) }
    end
  end
end
