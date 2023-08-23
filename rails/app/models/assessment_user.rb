class AssessmentUser < ApplicationRecord
  belongs_to :city
  has_many :public_review, dependent: :destroy
  has_many :original_review, dependent: :destroy
end
