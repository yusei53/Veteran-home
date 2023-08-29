# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'TestFormViews' do
  describe 'GET /test_form_views' do
    it 'works! (now write some real specs)' do
      get '/assessment_forms'
      expect(response).to have_http_status(:ok)
    end
  end

  # rubocop:disable all
  describe 'POST /test_form_views' do
    it 'works! (now write some real specs)' do

      store=FactoryBot.create(:store)
      city=FactoryBot.create(:city)

      params = {"authenticity_token"=>"[FILTERED]", 
        "assessment_form"=>{
          "user_name"=>"", "user_name_kana"=>"", 
          "user_tel"=>"", "user_email"=>"", 
          "company"=>store.company.name, "branch"=>"", 
          "property_prefecture"=>"", "property_city"=>city.name, 
          "property_address"=>"", "property_type"=>"0", 
          "property_building_area_unit"=>"1", "property_exclusive_area"=>"", 
          "property_land_area"=>"", "property_building_area"=>"", 
          "property_floor_area"=>"", "url_param"=>"beteran-sumai", 
          "property_room_plan"=>"1", "property_constructed_year"=>""
          }, "commit"=>"査定依頼する"}
      post('/assessment_forms', params:params)
      expect(response).to redirect_to('/assessment_forms/thanks')
    end
  end
  # rubocop:enable all
end
