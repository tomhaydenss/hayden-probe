FactoryBot.define do
  factory :direction, class: Symbol do
    initialize_with { %i[n s e w].sample }
  end
end