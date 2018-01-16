FactoryBot.define do
  factory :item do
    name        { Faker::Lorem.name }
    price       { Faker::Number.decimal(2) }
    description { Faker::Lorem.paragraph  }
    category
  end
end