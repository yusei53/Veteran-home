# frozen_string_literal: true

class AddCityIdToCities < ActiveRecord::Migration[7.0]
  def change
    add_column :cities, :city_id, :integer, :null, false
  end
end
