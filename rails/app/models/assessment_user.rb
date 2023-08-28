# frozen_string_literal: true

class AssessmentUser < ApplicationRecord
  has_one :original_review, dependent: :destroy
  belongs_to :city

  # nameに対するバリデーション。イエウールAPIの仕様を満たす
  # validates_with ShimeiValidator

  validates_with EmailValidator

  validates :name, presence: true
  # バリデーションなし :yomi
  # EmailFormatValidatorで:emailをバリデーション``
  validates :assessment_request_date, presence: true
  validates :is_received, inclusion: [true, false]
  validates :gender_id, inclusion: { in: Gender.all.map(&:id).push(nil) }
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0, allow_nil: true }
  # バリデーションなし :address
end
