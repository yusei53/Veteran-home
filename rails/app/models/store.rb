# frozen_string_literal: true

class Store < ApplicationRecord
  belongs_to :company
  belongs_to :city
  has_many :cities, dependent: :nullify, through: :assessment_areas
  has_many :assessment_areas, dependent: :destroy
  has_many :original_reviews, dependent: :destroy
end
