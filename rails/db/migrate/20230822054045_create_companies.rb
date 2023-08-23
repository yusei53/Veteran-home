class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.references :store, null:false, foreign_key: true
      t.string :name, null:false

      t.timestamps
    end
  end
end
