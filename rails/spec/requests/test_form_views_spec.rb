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

      forms = FactoryBot.build(:assessment_form).attributes.symbolize_keys
      forms[:branch_id]=store.id
      forms[:property_city_id]=city.id
      forms[:property_prefecture_id]=city.prefecture.id

      params={"authenticity_token"=>"[FILTERED]", "assessment_form"=>forms,"commit"=>"査定依頼する"}

      post('/assessment_forms', params:params)
      expect(response).to redirect_to('/assessment_forms/thanks')
    end
  end
  # rubocop:enable all
end
