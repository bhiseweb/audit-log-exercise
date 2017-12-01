FactoryBot.define do
  factory :activity_log do
    logable_type Faker::Name.name
    logable_id Faker::Number.number
    changes_text  Faker::Lorem.sentence
  end
end