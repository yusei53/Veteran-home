# frozen_string_literal: true

class OriginalReview < ApplicationRecord
  has_one :public_review, dependent: :destroy
  belongs_to :city
  belongs_to :store
  belongs_to :assessment_user
end
