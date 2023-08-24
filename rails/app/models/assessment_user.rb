# frozen_string_literal: true

class AssessmentUser < ApplicationRecord
  # belongs_to :original_review
  has_one :original_review, dependent: :destroy
end
