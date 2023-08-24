# frozen_string_literal: true

class AddAgeToAssessmentUser < ActiveRecord::Migration[7.0]
  def change
    add_column :assessment_users, :age, :integer
    add_reference :assessment_users, :city, foreign_key: true
    add_column :assessment_users, :address, :string
  end
end
