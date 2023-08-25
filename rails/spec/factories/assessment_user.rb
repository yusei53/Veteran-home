# frozen_string_literal: true

FactoryBot.define do
  factory :assessment_user do
    name = Faker::Name.name
    name { name }
    yomi { name }
    email { Faker::Internet.email }
    assessment_request_date { Faker::Date.between(from: 1.year.ago, to: 10.days.ago) }
    is_received { Faker::Boolean.boolean(true_ratio: 0.5) }
    # gender_id
    age { Faker::Number.number(digits: 3) }
    address { Faker::Address.street_address }

    city
  end
end
