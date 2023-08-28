# frozen_string_literal: true

FactoryBot.define do
  factory :company do
    name { Faker::Company.name }
    ieul_company_id { Faker::Number.number(digits: 3) }
  end
end
