# frozen_string_literal: true

class Prefecture < ApplicationRecord
  has_many :cities, dependent: :destroy
  validates :name, presence: true
  validates :prefecture_id, presence: true, numericality: { only_integer: true }
end
