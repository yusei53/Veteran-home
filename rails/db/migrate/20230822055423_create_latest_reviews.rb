class CreateLatestReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :latest_reviews do |t|
      t.references :assessment_user, null: false, foreign_key: true
      t.bigint :property_city_id, null: false, index: true
      # t.references :city, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true
      t.string :property_address, null:false
      t.integer :property, null: false #物件種別
      t.integer :num_sale, null: false #売却回数は選択肢
      t.date :date_considered,null: false
      t.date :date_assessment,null: false
      t.date :start_sale,null: false
      t.date :end_sale,null: false
      t.date :date_handover,null: false
      t.integer :score_speed,null: false
      t.integer :price_assessment, null: false
      t.integer :price_sale, null: false
      t.boolean :is_discount, null: false
      t.integer :discount_n_month_later #売り出してから何ヶ月後に値下げしたか null OK
      t.integer :price_discount #null OK
      t.integer :price_contract, null: false
      t.integer :score_contract, null: false
      t.integer :contract_type, null: false
      t.string :headline, null: false
      t.integer :reason_sale, null: false #売却理由は選択肢
      t.string :anxiety, null: false
      t.string :reason_decision, null: false
      t.integer :score_store, null: false #対応満足度
      t.string :reason_score, null: false
      t.string :advice, null: false
      t.string :improvement #null OK

      t.timestamps
    end
    add_foreign_key :latest_reviews, :cities, column: :property_city_id
  end
end
