class City < ApplicationRecord
  belongs_to :prefecture
  has_many :assessment_user
  has_many :public_review
  has_many :original_review
  has_many :store
  has_many :assessment_area
  has_many :store, dependent: :destroy, through: :assessment_area 
end
