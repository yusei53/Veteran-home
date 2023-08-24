# frozen_string_literal: true

class AssessmentUser < ApplicationRecord
  belongs_to :original_review
end
