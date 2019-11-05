RSpec.describe Hayden::Probe::Rules::UpperRightValidator do
  describe '#valid_coordinate?' do
    subject { DummyValidator.new.valid?(upper_right_coordinate) }

    context 'when a given coordinate is valid for a surface' do
      let(:upper_right_coordinate) { build(:valid_coordinate_for_surface) }

      it { is_expected.to be_truthy }
    end

    context 'when a given coordinate is invalid for a surface' do
      let(:upper_right_coordinate) { build(:invalid_coordinate_for_surface) }
      it { is_expected.to be_falsey }
    end
  end
end

class DummyValidator
  include Hayden::Probe::Rules::UpperRightValidator

  def valid?(coordinate)
    valid_coordinate?(coordinate)
  end
end
