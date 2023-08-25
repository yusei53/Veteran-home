# frozen_string_literal: true

FactoryBot.define do
  factory :prefecture do
    name { Faker::Address.city }
    prefecture_id { Faker::Number.number(digits: 3) }
  end
end
