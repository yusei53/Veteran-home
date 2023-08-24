# frozen_string_literal: true

class CreateOriginalReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :original_reviews do |t|
      t.bigint :property_city_id, null: false, index: true
      t.references :store, null: false, foreign_key: true

      t.string :property_address, null: false
      t.integer :property, null: false, comment: '物件種別'
      t.integer :num_sale, null: false, comment: '売却回数は選択肢'
      t.date :date_considered, null: false
      t.date :date_assessment, null: false
      t.date :start_sale, null: false
      t.date :end_sale, null: false
      t.date :date_handover, null: false
      t.integer :score_speed, null: false
      t.integer :price_assessment, null: false
      t.integer :price_sale, null: false
      t.boolean :is_discount, null: false, default: false
      t.integer :discount_n_month_later, comment: '売り出してから何ヶ月後に値下げしたか'
      t.integer :price_discount
      t.integer :price_contract, null: false
      t.integer :score_contract, null: false
      t.integer :contract_type, null: false
      t.text :headline, null: false
      t.integer :reason_sale, null: false, comment: '売却理由は選択肢'
      t.text :anxiety, null: false
      t.text :reason_decision, null: false
      t.integer :score_store, null: false, comment: '対応満足度'
      t.text :reason_score, null: false
      t.text :advice, null: false
      t.text :improvement

      t.timestamps
    end
    add_foreign_key :original_reviews, :cities, column: :property_city_id
  end
end
