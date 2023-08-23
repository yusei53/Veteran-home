# frozen_string_literal: true

class City < ApplicationRecord
  belongs_to :prefecture
  has_many :assessment_users, dependent: :destroy
  has_many :public_reviews, dependent: :destroy
  has_many :original_reviews, dependent: :destroy
  has_many :assessment_areas, dependent: :destroy
  has_many :stores, dependent: :destroy, through: :assessment_areas
end
