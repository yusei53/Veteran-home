# frozen_string_literal: true

class Store < ApplicationRecord
  belongs_to :company
  belongs_to :city
  has_many :cities, dependent: :nullify, through: :assessment_areas
  has_many :assessment_areas, dependent: :destroy
  has_many :original_reviews, dependent: :destroy

  validates :ieul_store_id, numericality: { only_integer: true }
  validates :logo_url, presence: true
  validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
  validates :address, presence: true
  validates :phone_number, format: { with: /\A[0-9]{2,3}-[0-9]{4}-[0-9]{4}\z/ }
  validates :fax_number, format: { with: /\A[0-9]{2,3}-[0-9]{4}-[0-9]{4}\z/ }
  validates :catch_copy, presence: true
  validates :introduction, presence: true
end
