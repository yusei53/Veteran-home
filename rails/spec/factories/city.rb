# frozen_string_literal: true

FactoryBot.define do
  factory :city do
    city_name = Faker::Address.city
    name { city_name }
    yomi { city_name }
    city_id { Faker::Number.number(digits: 5) }

    prefecture
  end
end
