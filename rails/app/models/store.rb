# frozen_string_literal: true

class Store < ApplicationRecord
  has_one :company
  belongs_to :city
  has_many :assessment_areas
  has_many :cities, dependent: :destroy, through: :assessment_areas
  has_many :original_reviews
end
