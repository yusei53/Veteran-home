class CreatePrefectures < ActiveRecord::Migration[7.0]
  def change
    create_table :prefectures do |t|
      t.references :city, null:false, foreign_key: true
      t.string :name, null: false
      t.string :yomi, null: false

      t.timestamps
    end
  end
end
