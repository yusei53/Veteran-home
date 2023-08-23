# frozen_string_literal: true

class AssessmentUser < ApplicationRecord
  belongs_to :city
  has_many :public_reviews, dependent: :destroy
  has_many :original_reviews, dependent: :destroy
end
