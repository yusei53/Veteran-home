# frozen_string_literal: true

require 'httpclient'
require 'json'
class AssessmentFormsController < ApplicationController
  def complete; end

  def new
    @form = AssessmentForm.new
  end

  def create
    # formをAPIに送る部分はOK
    # あとはvalidationのみ

    client = HTTPClient.new
    url = 'https://miniul-api.herokuapp.com/affiliate/v2/conversions'

    form_params = permit_form_params.to_hash.symbolize_keys # これは店舗や市区が文字列のままだからidに変換しないといけない

    # >> 文字列をIDに変換 >>
    company_instance = Company.find_by(name: form_params[:company])
    branch_id = Store.find_by(company: company_instance).ieul_store_id
    property_city_id = City.find_by!(name: form_params[:property_city]).city_id
    # >> 文字列をIDに変換 >>

    body = form_params.dup
    body.delete(:branch) # 店舗名の文字列はいらないから捨てる
    body.delete(:company) # 企業名もいらないから捨てる
    body[:branch_id] = branch_id
    body[:property_city] = property_city_id

    response = client.post(url, body)

    return unless response.status == 200

    redirect_to '/assessment_forms/thanks'
  end

  private

  def permit_form_params
    params.require(:assessment_form).permit(
      :company,
      :branch,
      :property_city,
      :property_address,
      :property_type,
      :property_exclusive_area,
      :property_land_area,
      :property_building_area,
      :property_building_area_unit,
      :property_floor_area,
      :url_param,
      :property_room_plan,
      :property_constructed_year,
      :user_email,
      :user_name,
      :user_name_kana,
      :user_tel
    )
  end
end
