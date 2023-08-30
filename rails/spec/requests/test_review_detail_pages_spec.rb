# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'TestReviewDetailPages' do
  describe 'GET /test_review_detail_pages' do
    it 'works! (now write some real specs)' do
      review = create(:public_review)
      p review
      get "/reviews/#{review.id}"
      expect(response).to have_http_status(:ok)
    end
  end
end
