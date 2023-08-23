# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :stores, dependent: :destroy
  validates :name, presence: true
  validates :name, :ieul_company_id, presence: true
end
