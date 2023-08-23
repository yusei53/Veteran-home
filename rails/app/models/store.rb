class Store < ApplicationRecord
  has_one :company
  belongs_to :city
  has_many :city, dependent: :destroy, through: :assessment_area
  has_many :original_review
end
