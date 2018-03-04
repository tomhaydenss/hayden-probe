FactoryBot.define do
  factory :direction, class: String do
    initialize_with { %w[N S E W].sample }
  end

end