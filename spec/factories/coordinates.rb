FactoryBot.define do
  factory :coordinate, class: Hayden::Probe::Core::Coordinate do
    x { rand(0..9) }
    y { rand(0..9) }

    factory :valid_coordinate_for_surface do
      x { rand(3..9) }
      y { rand(3..9) }
    end

    factory :invalid_coordinate_for_surface do
      x { rand(0..2) }
      y { rand(0..2) }
    end

    factory :upper_right_surface_specified_at_example do
      x 5
      y 5
    end

    factory :coordinate_for_first_probe do
      x 1
      y 2
    end

    factory :coordinate_for_second_probe do
      x 3
      y 3
    end
  end
end