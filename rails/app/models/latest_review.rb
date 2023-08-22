class LatestReview < ApplicationRecord
  belongs_to :assessment_user
  belongs_to :city
  belongs_to :store
  belongs_to :original_review
end
