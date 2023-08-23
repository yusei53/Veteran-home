# frozen_string_literal: true

class AddPrefectureIdToPrefectures < ActiveRecord::Migration[7.0]
  def change
    add_column :prefectures, :prefecture_id, :integer, null:false
  end
end
