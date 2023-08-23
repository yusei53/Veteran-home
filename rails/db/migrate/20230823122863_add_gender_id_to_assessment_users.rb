# frozen_string_literal: true

class AddGenderIdToAssessmentUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :assessment_users, :gender_id, :integer
  end
end
