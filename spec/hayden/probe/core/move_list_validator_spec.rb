RSpec.describe Hayden::Probe::Core::MoveListValidator do

  describe '.validate_move_list' do

    subject { DummyValidator.new.validate_move_list(move_list) }

    context 'when a given move list is valid' do
      let(:move_list) { %i[l m l m l m l m m] }
      it { is_expected.to be_truthy }
    end

    context 'when a given list contains invalid movements' do
      let(:move_list) { %i[w w w] }
      it { expect { subject }.to raise_error(Hayden::Probe::Core::InvalidInputData) }
    end

    context 'when a given list is empty' do
      let(:move_list) { [] }
      it { expect { subject }.to raise_error(Hayden::Probe::Core::InvalidInputData) }
    end

  end

end

class DummyValidator
  include Hayden::Probe::Core::MoveListValidator
end