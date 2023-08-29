# frozen_string_literal: true

class AssessmentUser < ApplicationRecord
  has_one :original_review, dependent: :destroy

  validates :name, presence: true
  validates :email, email: true
  validates :assessment_request_date, presence: true
  validates :is_received, inclusion: [true, false]
  validates :gender_id, inclusion: { in: Gender.all.map(&:id).push(nil) }
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0, allow_nil: true }
end
