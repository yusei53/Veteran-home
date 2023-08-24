# frozen_string_literal: true

class OriginalReview < ApplicationRecord
  has_one :public_review, dependent: :destroy
  belongs_to :city, foreign_key: :property_city_id, inverse_of: :original_reviews
  belongs_to :store
  belongs_to :assessment_user
end
