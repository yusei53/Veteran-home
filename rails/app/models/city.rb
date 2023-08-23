class City < ApplicationRecord
  belongs_to :prefecture
  has_many :assessment_user
  has_many :latest_review
  has_many :original_review
  has_many :store
  has_many :assessment_area, dependent: :destroy, through: :store 
end
