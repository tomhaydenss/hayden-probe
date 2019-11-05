RSpec.describe Hayden::Probe::Rules::PositionValidator do
  describe '#valid_position?' do
    let(:position) { build(:position) }
    let(:dimensions) { build(:valid_coordinate_for_surface) }

    subject { DummyValidator.new.valid?(position, dimensions) }

    context 'when position is valid' do
      it { is_expected.to be_truthy }
    end

    context 'when position has negative coordinates' do
      let(:position) { build(:negative_coordinates) }

      it { is_expected.to be_falsey }
    end

    context 'when position has coordinates that overflows dimensions limit' do
      let(:position) { build(:overflowed_coordinates) }

      it { is_expected.to be_falsey }
    end
  end
end

class DummyValidator
  include Hayden::Probe::Rules::PositionValidator

  attr_accessor :positions

  def initialize
    @positions = {}
  end

  def valid?(new_position, dimensions)
    valid_position?(new_position, dimensions)
  end
end
