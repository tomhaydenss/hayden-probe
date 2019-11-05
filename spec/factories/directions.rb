FactoryBot.define do
  factory :direction, class: Hayden::Probe::Direction do
    current { FactoryBot.build(:orientation) }
  end
end
