RSpec.describe Hayden::Probe::Controller do
  let(:upper_right_coordinate) { build(:valid_coordinate_for_surface) }
  let(:surface) { Hayden::Probe::Surface.new(upper_right_coordinate) }
  let(:controller) { Hayden::Probe::Controller.new(surface) }

  describe '.new' do
    context 'when correct information are given' do
      subject { controller }

      it { expect(subject).not_to be nil }
      it { expect(subject).to be_a(Hayden::Probe::Controller) }
      it { expect(subject).to be_truthy }
    end

    context 'when incorrect information are given' do
      let(:upper_right_coordinate) { build(:invalid_coordinate_for_surface) }

      it { expect { surface }.to raise_error(Hayden::Probe::Errors::BusinessError) }
    end
  end

  describe '#add_probe' do
    let(:probe) { build(:probe) }
    subject { controller.add_probe(probe) }

    context 'when success' do
      it { expect(subject).to be_truthy }
    end

    context 'when another probe already exists at the same position' do
      let(:another_probe) { build(:probe, position: probe.position) }

      before { controller.add_probe(another_probe) }

      it { expect { subject }.to raise_error(Hayden::Probe::Errors::BusinessError) }
    end
  end

  describe '#move_probe' do
    let(:upper_right_coordinate) { build(:upper_right_surface_specified_at_example) }
    let(:probe) { Hayden::Probe::Probe.new(position.x, position.y, direction) }

    subject { controller.move_probe(probe, *move_list) }

    before do
      controller.add_probe(probe)
      subject
    end

    context 'first example from specification' do
      let(:position) { build(:coordinate_for_first_probe) }
      let(:direction) { build(:north) }
      let(:move_list) { %i[l m l m l m l m m] }

      it { expect(probe.position.x).to eq(1) }
      it { expect(probe.position.y).to eq(3) }
      it { expect(probe.direction.current).to eq(:n) }
    end

    context 'second example from specification' do
      let(:position) { build(:coordinate_for_second_probe) }
      let(:direction) { build(:east) }
      let(:move_list) { %i[m m r m m r m r r m] }

      it { expect(probe.position.x).to eq(5) }
      it { expect(probe.position.y).to eq(1) }
      it { expect(probe.direction.current).to eq(:e) }
    end

    context 'when a movement results in an wrong place' do
      let(:position) { upper_right_coordinate }
      let(:direction) { build(:north) }
      let(:move_list) { %i[m] }

      it { expect(probe.position.x).to eq(position.x) }
      it { expect(probe.position.y).to eq(position.y) }
      it { expect(probe.direction.current).to eq(direction) }
    end
  end
end