FactoryBot.define do
  factory :patient do
    first_name Faker::Name.first_name
    last_name  Faker::Name.last_name
    physician_name  Faker::Name.name
  end
end