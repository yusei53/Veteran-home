# frozen_string_literal: true

class AssessmentArea < ApplicationRecord
  belongs_to :store
  belongs_to :city

  validates :store, :city, presence: true
end
