# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'TestStoreViews' do
  describe 'GET /test_store_views' do
    it 'works! (now write some real specs)' do
      store = create(:store)
      get store_path(store)
      expect(response).to have_http_status(:ok)
    end
  end
end
