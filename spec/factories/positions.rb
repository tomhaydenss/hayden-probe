FactoryBot.define do
  factory :position, class: Hayden::Probe::Position do
    x_axis { rand(3..5) }
    y_axis { rand(3..5) }

    factory :valid_coordinate_for_surface do
      x_axis { rand(Hayden::Probe::Rules::UpperRightValidator::WIDTH_LIMITS) }
      y_axis { rand(Hayden::Probe::Rules::UpperRightValidator::HEIGHT_LIMITS) }
    end

    factory :invalid_coordinate_for_surface do
      x_axis 0
      y_axis 0
    end

    factory :negative_coordinates do
      x_axis { rand(-9..-1) }
      y_axis { rand(-9..-1) }
    end

    factory :overflowed_coordinates do
      x_axis { Hayden::Probe::Rules::UpperRightValidator::WIDTH_LIMITS.max + 1 }
      y_axis { Hayden::Probe::Rules::UpperRightValidator::HEIGHT_LIMITS.max + 1 }
    end

    factory :upper_right_surface_specified_at_example do
      x_axis 5
      y_axis 5
    end

    factory :coordinate_for_first_probe do
      x_axis 1
      y_axis 2
    end

    factory :coordinate_for_second_probe do
      x_axis 3
      y_axis 3
    end
  end
end
