# frozen_string_literal: true

class AssessmentUser < ApplicationRecord
  has_one :original_review, dependent: :destroy
  belongs_to :city
  
  # nameに対するバリデーション。イエウールAPIの仕様を満たす
  # validates_with ShimeiFormatValidator

  validates_with EmailFormatValidator

  validates :name, presence: true
  validates :email, presence: true
  validates :is_recieved, presence: true, inclusion: [true,false]
  validates :gender_id, inclusion: { in: Gender.all.map(&:id) }
end
