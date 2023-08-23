class City < ApplicationRecord
  belongs_to :prefecture
  has_many :assessment_users
  has_many :public_reviews
  has_many :original_reviews
  has_many :stores
  has_many :assessment_areas
  has_many :stores, dependent: :destroy, through: :assessment_areas 
end
