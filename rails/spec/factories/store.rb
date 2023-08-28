# frozen_string_literal: true

FactoryBot.define do
  factory :store do
    ieul_store_id { Faker::Number.number(digits: 3) }
    name { Faker::Company.name }
    logo_url { Faker::Internet.url(host: 'example.com') }
    # post_code { Faker::Address.postcode }
    post_code { '000-0000' }
    address { Faker::Address.street_address }
    # phone_number { Faker::PhoneNumber.phone_number }
    # fax_number { Faker::PhoneNumber.phone_number }
    phone_number { '000-0000-0000' }
    fax_number { '000-0000-0000' }
    start_time = Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
    end_time = start_time + 9.hours
    open_time = "平日#{start_time.strftime('%H:%M')}~#{end_time.strftime('%H:%M')}"
    open_time { open_time }
    holiday { Faker::Space.galaxy }
    catch_copy { Faker::Space.galaxy }
    introduction { Faker::Space.galaxy }

    city
    company
  end
end
