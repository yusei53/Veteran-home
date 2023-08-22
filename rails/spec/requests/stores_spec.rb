# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Stores' do
  describe 'GET /stores' do
    it '企業(店舗)ページにアクセスする' do
      get '/stores/2'
      expect(response).to have_http_status(:ok)
    end
  end
end
