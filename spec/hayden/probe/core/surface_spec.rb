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

      it { expect { surface }.to raise_error(ArgumentError) }
    end
  end

end