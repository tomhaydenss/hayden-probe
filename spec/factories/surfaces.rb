FactoryBot.define do
  factory :surface, class: Hayden::Probe::Surface do
    dimensions { FactoryBot.build(:valid_coordinate_for_surface) }
    positions { {} }
  end
end
