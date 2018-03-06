FactoryBot.define do
  factory :direction, class: Symbol do
    initialize_with { %i[n s e w].freeze.sample }

    factory :north do
      initialize_with { :n }
    end

    factory :east do
      initialize_with { :e }
    end
  end
end