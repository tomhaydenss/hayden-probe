FactoryBot.define do
  factory :probe, class: Hayden::Probe::Probe do
    position { FactoryBot.build(:position, x_axis: 0, y_axis: 0) }
    direction { FactoryBot.build(:direction) }
  end
end
