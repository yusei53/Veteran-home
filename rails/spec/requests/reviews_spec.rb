# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Reviews' do
  describe 'GET /reviews' do
    it '口コミ詳細ページにアクセスする' do
      get '/reviews/1'
      expect(response).to have_http_status(:ok)
    end
  end
end
