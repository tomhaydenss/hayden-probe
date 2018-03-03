RSpec.describe Hayden::Probe::Core::Coordinate do

  describe '.new' do

    context 'when coordinates information are given' do
      subject(:coordinate) { Hayden::Probe::Core::Coordinate.new(1, 3) }

      it { expect(coordinate).not_to be nil }
      it { expect(coordinate.x).to eq(1) }
      it { expect(coordinate.y).to eq(3) }
    end

    context 'when no coordinates information are given' do
      subject(:coordinate) { Hayden::Probe::Core::Coordinate.new }

      it { expect(coordinate).not_to be nil }
      it { expect(coordinate.x).to eq(0) }
      it { expect(coordinate.y).to eq(0) }
    end

  end

end
