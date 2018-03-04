FactoryBot.define do
  factory :coordinate, class: Hayden::Probe::Core::Coordinate do
    x { rand(0..9) }
    y { rand(0..9) }
  end

  factory :valid_coordinate_for_surface, class: Hayden::Probe::Core::Coordinate do
    x { rand(3..9) }
    y { rand(3..9) }
  end

  factory :invalid_coordinate_for_surface, class: Hayden::Probe::Core::Coordinate do
    x { rand(0..2) }
    y { rand(0..2) }
  end
end