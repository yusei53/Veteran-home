# frozen_string_literal: true

class AssessmentUser < ApplicationRecord
  has_one :original_review, dependent: :destroy

  validates :name, :yomi, shimei_format:
  # validate :email, email_format:
  validates :name, :yomi, presence: true
  validates :email, presence: true
  validates :is_recieved, presence: true
  # validates :original_review_id, presence: true
  validates :gender_id, inclusion: { in: Gendestroy
.all.map(&:id) }
