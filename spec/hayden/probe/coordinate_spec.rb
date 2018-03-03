RSpec.describe Hayden::Probe::Coordinate do
  it "creates a coordinate" do
    coordinate = Hayden::Probe::Coordinate.new(1, 3)
    expect(coordinate).not_to be nil
    expect(coordinate.x).to eq(1)
    expect(coordinate.y).to eq(3)
  end

  it "creates a default coordinate" do
    coordinate = Hayden::Probe::Coordinate.new
    expect(coordinate).not_to be nil
    expect(coordinate.x).to eq(0)
    expect(coordinate.y).to eq(0)
  end
end
