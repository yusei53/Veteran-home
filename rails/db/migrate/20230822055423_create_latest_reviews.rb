class CreateLatestReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :latest_reviews do |t|
      t.references :assessment_user, null: false, foreign_key: true
      t.integer :property_city_id, null: false, index: true
      # t.references :city, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true
      t.references :original_review, null: false, foreign_key: true
      t.string :address
      t.string :property
      t.integer :num_sale
      t.date :date_considered
      t.date :date_assessment
      t.date :start_sale
      t.date :end_sale
      t.date :date_handover
      t.integer :score_speed
      t.integer :price_assessment
      t.integer :price_sale
      t.boolean :is_discount
      t.integer :discount_n_month_later
      t.integer :price_discount
      t.integer :price_contract
      t.integer :score_contract
      t.integer :contract_type
      t.string :headline
      t.string :reason_sale
      t.string :anxiety
      t.string :reason_decision
      t.integer :score_store
      t.string :reason_score
      t.string :advice
      t.string :improvement

      t.timestamps
    end
    add_foreign_key :original_reviews, :city, column: :property_city_id
  end
end
