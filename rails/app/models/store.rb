class Store < ApplicationRecord
  has_one :company
  belongs_to :city
  has_many :assessment_area, dependent: :destroy, through: :city
  has_many :original_review
  has_many :public_review
end
