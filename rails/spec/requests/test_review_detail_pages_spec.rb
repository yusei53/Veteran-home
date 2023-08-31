# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable all
RSpec.describe 'TestReviewDetailPages' do
  describe 'GET /test_review_detail_pages' do
    it 'works! (now write some real specs)' do
      review = create(:public_review)
      store = review.original_review.store
      get "/areas/#{store.city.prefecture.id}/city/#{store.city.id}"
      get "/stores/#{store.id}"
      get "/reviews/#{review.id}"
      expect(response).to have_http_status(:ok)
    end
  end
end
# rubocop:enable all
