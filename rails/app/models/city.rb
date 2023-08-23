# frozen_string_literal: true

class City < ApplicationRecord
  belongs_to :prefecture
  has_many :assessment_users, dependent: :nullify
  has_many :public_reviews, dependent: :nullify
  has_many :original_reviews, dependent: :nullify
  has_many :assessment_areas, dependent: :destroy
  has_many :stores, dependent: :nullify, through: :assessment_areas

  validates :name, :yomi, presence: true
end
