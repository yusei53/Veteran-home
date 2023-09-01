# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable all
RSpec.describe 'TestReviewDetailPages' do
  describe 'GET /test_review_detail_pages' do
    it 'works! (now write some real specs)' do
      review = create(:public_review)
      store = review.original_review.store

      assessment_area=FactoryBot.build(:assessment_area)
      assessment_area.city=store.city
      assessment_area.store=store
      assessment_area.save

      get "/areas/#{assessment_area.city.prefecture.id}/city/#{assessment_area.city.id}"
      get "/reviews/#{review.id}"

      expect(response).to have_http_status(:ok)
    end
  end
end
# rubocop:enable all
