# frozen_string_literal: true

class City < ApplicationRecord
  belongs_to :prefecture
  has_many :assessment_users, dependent: :nullify
  has_many :original_reviews, dependent: :nullify
  has_many :assessment_areas, dependent: :destroy
  has_many :stores, dependent: :nullify, through: :assessment_areas

  validates :name, :yomi, presence: true
  # 　city_idは Cityのキーではない、正しくはieul_city_id
  validates :city_id, presence: true, numericality: { only_integer: true }
end
