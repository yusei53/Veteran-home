# frozen_string_literal: true

class PublicReview < ApplicationRecord
  belongs_to :original_review
end
