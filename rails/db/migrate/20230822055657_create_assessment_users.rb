class CreateAssessmentUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :assessment_users do |t|
      t.string :name
      t.string :yomi
      t.string :email
      t.references :city, null: false, foreign_key: true
      t.date :assessment_request_data
      t.boolean :is_received

      t.timestamps
    end
  end
end
