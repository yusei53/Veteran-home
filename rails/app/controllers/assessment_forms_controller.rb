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

    HTTPClient.new

    form_params = permit_form_params

    body = form_params.to_hash
    body[:branch_id] = 1 # branch_idはintegerじゃないと422が返ってくる。ほかはなんでも大丈夫そう.

    return unless response.status == 200

    redirect_to '/assessment_forms/thanks'
  end

  private

  def permit_form_params
    params.require(:assessment_form).permit(
      :branch_id,
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
