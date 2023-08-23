# frozen_string_literal: true

class CreateAssessmentUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :assessment_users do |t|
      t.string :name, null: false
      t.string :yomi, null: false
      t.string :email, null: false
      t.references :original_review, null: false, foreign_key: true
      t.date :assessment_request_date, null: false
      t.boolean :is_received, null: false, default: false

      t.timestamps
    end
  end
end
