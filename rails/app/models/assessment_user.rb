# frozen_string_literal: true

class AssessmentUser < ApplicationRecord
  has_one :original_review, dependent: :destroy
  belongs_to :city
end
