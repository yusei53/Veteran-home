class CreateCities < ActiveRecord::Migration[7.0]
  def change
    create_table :cities do |t|
      t.references :prefecture, null: false, foreign_key: true
      t.references :assessment_users,foreign_key: true
      t.references :original_review, foreign_key: true
      t.references :latest_review, foreign_key: true
      t.references :store, foreign_key: true
      t.references :assessment_area, foreign_key: true
      t.string :name, null: false
      t.string :yomi, null: false

      t.timestamps
    end
  end
end
