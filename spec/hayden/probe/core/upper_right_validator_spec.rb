RSpec.describe Hayden::Probe::Core::UpperRightValidator do

  describe '.validate_upper_right' do

    subject { DummyValidator.new.validate_upper_right_coordinate(upper_right_coordinate) }

    context 'when a given coordinate is valid for a surface' do
      let(:upper_right_coordinate) { build(:valid_coordinate_for_surface) }
      it { is_expected.to be_truthy }
    end

    context 'when a given coordinate is invalid for a surface' do
      let(:upper_right_coordinate) { build(:invalid_coordinate_for_surface) }
      it { expect { subject }.to raise_error(Hayden::Probe::Core::InvalidInputData) }
    end

  end

end

class DummyValidator
  include Hayden::Probe::Core::UpperRightValidator
end