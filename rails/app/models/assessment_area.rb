# frozen_string_literal: true

class AssessmentArea < ApplicationRecord
  belongs_to :store
  belongs_to :city
end
