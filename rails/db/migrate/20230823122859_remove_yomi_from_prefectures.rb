# frozen_string_literal: true

class RemoveYomiFromPrefectures < ActiveRecord::Migration[7.0]
  def change
    remove_column :prefectures, :yomi, :string
  end
end
