# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable all
RSpec.describe 'TestStoreViews' do
  describe 'GET /test_store_views' do
    it 'works! (now write some real specs)' do
      review = create(:public_review)
      store = review.original_review.store

      assessment_area = build(:assessment_area)
      assessment_area.city = store.city
      assessment_area.store = store
      assessment_area.save

      get "/areas/#{assessment_area.city.prefecture.id}/city/#{assessment_area.city.id}"
      get store_path(store)
      expect(response).to have_http_status(:ok)
    end
  end
end
# rubocop:enable all
