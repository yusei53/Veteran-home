class Store < ApplicationRecord
  has_one :company
  belongs_to :city
  has_many :assessment_area, belongs_to: :destroy, through: :ciry
  has_many :original_review
  has_many :latest_review
end
