FactoryBot.define do
  factory :product do
    name { Faker::Name.name }
    description { Faker::Restaurant.description }
    price {Faker::Number.decimal(l_digits: 2)}
    publish = Faker::Boolean.boolean
  end
end