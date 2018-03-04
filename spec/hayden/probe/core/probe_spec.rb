RSpec.describe Hayden::Probe::Core::Probe do

  describe '.new' do

    let(:coordinate) { build(:coordinate) }
    let(:direction) { build(:direction) }

    subject(:probe) { Hayden::Probe::Core::Probe.new(coordinate, direction) }

    context 'when correct information are given' do
      it { expect(probe).not_to be nil }
      it { expect(probe.coordinate).to eq(coordinate) }
      it { expect(probe.direction).to eq(direction) }
    end

    context 'when incorrect information are given' do
      let(:direction) { :a }

      it { expect { probe }.to raise_error(ArgumentError) }
    end
  end

end