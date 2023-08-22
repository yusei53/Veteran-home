class CreateOptouts < ActiveRecord::Migration[7.0]
  def change
    create_table :optouts do |t|
      t.string :emal

      t.timestamps
    end
  end
end
