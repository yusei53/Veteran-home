# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'TestAreaPages' do
  describe 'GET /test_area_pages' do
    it 'works! (now write some real specs)' do
      city = create(:city)
      get "/areas/#{city.prefecture.id}/city/#{city.id}"
      expect(response).to have_http_status(:ok)
    end
  end
end
