# frozen_string_literal: true

class OriginalReview < ApplicationRecord
  has_one :public_review, dependent: :destroy
  belongs_to :city, foreign_key: :property_city_id
  belongs_to :store
  has_one :assessment_user
end
