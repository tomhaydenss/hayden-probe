FactoryBot.define do
  factory :coordinate, class: Hayden::Probe::Core::Coordinate do
    x { rand(0..9) }
    y { rand(0..9) }
  end
end