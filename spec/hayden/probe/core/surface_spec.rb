RSpec.describe Hayden::Probe::Core::Surface do

  describe '.new' do

    subject(:surface) { Hayden::Probe::Core::Surface.new(upper_right_coordinate) }

    context 'when correct information are given' do
      let(:upper_right_coordinate) { build(:valid_coordinate_for_surface) }

      it { expect(surface).not_to be nil }
      it { expect(surface.matrix.size).to eq(upper_right_coordinate.y) }
      it { expect(surface.matrix.first.size).to eq(upper_right_coordinate.x) }
    end

    context 'when incorrect information are given' do
      let(:upper_right_coordinate) { build(:invalid_coordinate_for_surface) }

      it { expect { surface }.to raise_error(Hayden::Probe::Core::InvalidInputData) }
    end
  end

  describe '#add_probe' do
    let(:upper_right_coordinate) { build(:upper_right_surface_specified_at_example) }
    let(:surface) { Hayden::Probe::Core::Surface.new(upper_right_coordinate) }

    subject(:result) { surface.add_probe(probe, move_list) }

    context 'first example from specification' do
      let(:coordinate) { build(:coordinate_for_first_probe) }
      let(:position) { build(:north) }
      let(:probe) { Hayden::Probe::Core::Probe.new(coordinate, position) }
      let(:move_list) { %i[l m l m l m l m m] }

      it { expect(result.coordinate.x).to eq(1) }
      it { expect(result.coordinate.y).to eq(3) }
      it { expect(result.direction).to eq(:n) }
    end

    context 'second example from specification' do
      let(:coordinate) { build(:coordinate_for_second_probe) }
      let(:position) { build(:east) }
      let(:probe) { Hayden::Probe::Core::Probe.new(coordinate, position) }
      let(:move_list) { %i[m m r m m r m r r m] }

      it { expect(result.coordinate.x).to eq(5) }
      it { expect(result.coordinate.y).to eq(1) }
      it { expect(result.direction).to eq(:e) }
    end
  end

end