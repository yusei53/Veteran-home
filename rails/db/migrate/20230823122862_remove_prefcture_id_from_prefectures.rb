class RemovePrefctureIdFromPrefectures < ActiveRecord::Migration[7.0]
  def change
    remove_column :prefectures, :prefcture_id, :integer
  end
end
