RSpec.describe Hayden::Probe::Rules::LandingValidator do
  describe '#probe_can_land?' do
    let(:validator_class) { DummyValidator.new }
    # let(:probe) { double('probe', id: 'abc123', position: position) }
    let(:probe) { build(:probe, id: 'abc123', position: position) }
    let(:position) { build(:position, x_axis: 0, y_axis: 0) }

    subject { validator_class.valid?(probe) }

    context 'when position is available' do
      it { is_expected.to be_truthy }
    end

    context 'when probe is already landed at position' do
      before { validator_class.positions[position.to_s] = probe }

      it { is_expected.to be_truthy }
    end

    context 'when position is invalid for landing' do
      # let(:another_probe) { double('probe', id: 'xyz321', position: position) }
      let(:another_probe) { build(:probe, id: 'xyz321', position: position) }
      let(:position) { build(:position, x_axis: 0, y_axis: 0) }

      before { validator_class.positions[position.to_s] = another_probe }

      it { is_expected.to be_falsey }
    end
  end
end

class DummyValidator
  include Hayden::Probe::Rules::LandingValidator

  attr_accessor :positions

  def initialize
    @positions = {}
  end

  def valid?(probe)
    probe_can_land?(probe)
  end
end
