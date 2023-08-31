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

    form_params = permit_form_params.to_hash.symbolize_keys

    @form = AssessmentForm.new(form_params)
    @form.valid?

    @is_bad_status = false # APIからのレスポンスがBADじゃないか？検出するパラメータ
    if @form.errors.any?
      render 'new', status: :unprocessable_entity
    else

      body = form_params.dup
      response = client.post(url, body)

      if response.status == 200
        redirect_to '/assessment_forms/thanks'

      else
        @is_bad_status = true
        render 'new', status: :unprocessable_entity

      end

    end
  end

  private

  def permit_form_params
    params.require(:assessment_form).permit(
      :branch_id,
      :property_city_id,
      :property_address,
      :property_type,
      :property_exclusive_area,
      :property_land_area,
      :property_building_area,
      :url_param,
      :property_room_plan,
      :property_constructed_year,
      :user_email,
      :user_name,
      :user_name_kana,
      :user_tel,
      :property_prefecture_id
    )
  end
end
