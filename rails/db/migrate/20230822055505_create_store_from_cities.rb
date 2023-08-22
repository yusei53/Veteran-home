class CreateStoreFromCities < ActiveRecord::Migration[7.0]
  def change
    create_table :store_from_cities do |t|
      t.references :store, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
