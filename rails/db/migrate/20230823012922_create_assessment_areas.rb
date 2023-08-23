class CreateAssessmentAreas < ActiveRecord::Migration[7.0]
  ## done
  def change
    create_table :assessment_areas do |t|
      t.references :store, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
