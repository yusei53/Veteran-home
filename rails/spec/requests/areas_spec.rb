# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Areas' do
  describe 'GET /areas' do
    it 'エリアページにアクセスする' do
      get '/areas/1'
      expect(response).to have_http_status(:ok)
    end
  end
end
