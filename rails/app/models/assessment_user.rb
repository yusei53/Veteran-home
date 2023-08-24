# frozen_string_literal: true

class AssessmentUser < ApplicationRecord
  belongs_to :city
  has_many :public_reviews, dependent: :destroy
  has_many :original_reviews, dependent: :destroy

  validates :name, :yomi, shimei_format:
  validates :email, email_format: 
  validates :is_recieved, presence: true
  validates :original_review_id, presence: true
  
end
