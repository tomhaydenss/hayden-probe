RSpec.describe Hayden::Probe::Position do
  describe '.new' do
    context 'when coordinates information are given' do
      subject(:position) { Hayden::Probe::Position.new(1, 3) }

      it { expect(position).not_to be nil }
      it { expect(position.x).to eq(1) }
      it { expect(position.y).to eq(3) }
    end

    context 'when coordinates information are not given' do
      subject(:position) { Hayden::Probe::Position.new }

      it { expect(position).not_to be nil }
      it { expect(position.x).to eq(0) }
      it { expect(position.y).to eq(0) }
    end
  end

  describe '#next' do
    let(:x) { 0 }
    let(:y) { 0 }

    subject(:position) { Hayden::Probe::Position.new(x, y) }

    before { position.next(direction) }

    context 'when facing North and move Forward' do
      let(:direction) { :n }
      it { expect(position.x).to eq(x) }
      it { expect(position.y).to eq(y + 1) }
      it { expect(position.to_s).to eq("#{position.x} #{position.y}") }
    end

    context 'when facing South and move Forward' do
      let(:direction) { :s }
      it { expect(position.x).to eq(x) }
      it { expect(position.y).to eq(y - 1) }
      it { expect(position.to_s).to eq("#{position.x} #{position.y}") }
    end

    context 'when facing East and move Forward' do
      let(:direction) { :e }
      it { expect(position.x).to eq(x + 1) }
      it { expect(position.y).to eq(y) }
      it { expect(position.to_s).to eq("#{position.x} #{position.y}") }
    end

    context 'when facing Weast and move Forward' do
      let(:direction) { :w }
      it { expect(position.x).to eq(x - 1) }
      it { expect(position.y).to eq(y) }
      it { expect(position.to_s).to eq("#{position.x} #{position.y}") }
    end
  end
end
