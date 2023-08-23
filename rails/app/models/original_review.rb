class OriginalReview < ApplicationRecord
  has_one :public_review, dependent: :destroy
  belongs_to :assessment_user
  belongs_to :city
  belongs_to :store
end
