RSpec.describe Hayden::Probe::Surface do
  describe '.new' do
    subject(:surface) { Hayden::Probe::Surface.new(upper_right_coordinate) }

    context 'when correct informations are given' do
      let(:upper_right_coordinate) { build(:valid_coordinate_for_surface) }

      it { expect(surface).not_to be nil }
      it { expect(surface).to be_a(Hayden::Probe::Surface) }
      it { expect(surface.dimensions.x).to eq(upper_right_coordinate.x) }
      it { expect(surface.dimensions.y).to eq(upper_right_coordinate.y) }
    end

    context 'when incorrect informations are given' do
      let(:upper_right_coordinate) { build(:invalid_coordinate_for_surface) }

      it { expect { surface }.to raise_error(Hayden::Probe::Errors::BusinessError) }
    end
  end

  describe '#land' do
    let(:probe) { build(:probe) }
    let(:upper_right_coordinate) { build(:valid_coordinate_for_surface) }
    let(:surface) { Hayden::Probe::Surface.new(upper_right_coordinate) }

    subject { surface.land(probe) }

    context 'when position is valid for landing' do
      it { is_expected.to be_truthy }
    end

    context 'when position is not valid for landing' do
      let(:another_probe) { build(:probe, position: probe.position) }

      before { surface.land(another_probe) }

      it { expect { subject }.to raise_error(Hayden::Probe::Errors::BusinessError) }
    end
  end

  describe '#update' do
    let(:probe) { build(:probe) }
    let(:upper_right_coordinate) { build(:valid_coordinate_for_surface) }
    let(:surface) { Hayden::Probe::Surface.new(upper_right_coordinate) }

    before do
      surface.land(probe)
      probe.update(x_axis: 0, y_axis: 0)
    end

    subject { surface.update(probe) }

    it { is_expected.to be_truthy }
  end
end
