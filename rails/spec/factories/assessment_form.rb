# frozen_string_literal: true

FactoryBot.define do
  factory :assessment_form do
    name = "#{Faker::Space.planet} #{Faker::Space.moon}"
    user_name { name }
    user_name_kana { name }
    user_tel { Faker::Number.leading_zero_number(digits: 10) }
    user_email { Faker::Internet.email }
    branch_id { Faker::Number.number(digits: 3) }
    property_prefecture_id { Faker::Number.number(digits: 4) }
    property_city_id { Faker::Number.number(digits: 4) }
    property_address { Faker::Address.street_address }
    property_type { Property.all.map(&:id).sample }
    property_exclusive_area { Faker::Number.decimal(l_digits: 3, r_digits: 3) }
    property_land_area { Faker::Number.decimal(l_digits: 3, r_digits: 3) }
    property_building_area { Faker::Number.decimal(l_digits: 3, r_digits: 3) }
    url_param { 'beteran-sumai' }
    property_room_plan { PropertyRoomPlan.all.map(&:id).sample }
    property_constructed_year { Faker::Number.number(digits: 2) }
  end
end
