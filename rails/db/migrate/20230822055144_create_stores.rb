class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.references :company, null: false, foreign_key: true
      t.string :name
      t.string :logo_url
      t.string :post_code
      t.references :prefecture, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true
      t.string :address
      t.string :phone_number
      t.string :fax_number
      t.string :open_time
      t.string :holiday
      t.string :catch_copy
      t.string :integerroduction

      t.timestamps
    end
  end
end
