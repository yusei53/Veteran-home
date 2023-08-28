# frozen_string_literal: true

require 'httpclient'
require 'json'
class AssessmentFormsController < ApplicationController
  def complete; end

  def new
    @form = AssessmentForm.new
  end

  def create
    client    = HTTPClient.new
    url       = 'https://miniul-api.herokuapp.com/affiliate/v2/conversions'
    body = { branch_id: 1, property_city: 1,
             property_address: '1234567', property_type: 1,
             property_exclusive_area: 1.3, property_land_area: 1.4,
             property_building_area: 1.3, property_building_area_unit: 1,
             property_floor_area: 1.2, url_param: 'beteran-sumai', property_room_plan: 1,
             property_constructed_year: 1, user_email: 'ddd@gmail.com',
             user_name: '山田 太郎', user_name_kana: 'やまだ たろう', user_tel: '0123456789' }
    response = client.post(url, body)

    return unless response.status == 200

    redirect_to '/assessment_forms/thanks'
  end
end
