# frozen_string_literal: true

FactoryBot.define do
  factory :original_review do
    property_address { Faker::Address.street_address }
    property { Property.all.map(&:id).sample } # 物件種別
    num_sale { NumSale.all.map(&:id).sample } # 売却回数
    sample_date = Faker::Time.between(from: DateTime.now - 1, to: DateTime.now).strftime('%Y-%m-%d')
    date_considered { sample_date } # 売却検討時期
    date_assessment { sample_date } # 査定時期
    start_sale { sample_date } # 売り出し時期
    end_sale { sample_date } # 売却時期
    date_handover { sample_date } # 引渡し時期
    score_speed { Faker::Number.within(range: 1..5) } # 売却スピード満足度
    price_assessment { Faker::Number.number(digits: 3) } # 査定価格
    price_sale { Faker::Number.number(digits: 3) } # 売却価格
    is_discount { Faker::Boolean.boolean(true_ratio: 0.5) } # 値下げしたかどうか
    discount_n_month_later { Faker::Number.number(digits: 1) } # 何ヶ月後に値下げしたか
    price_discount { Faker::Number.number(digits: 3) } # 値引き価格
    price_contract { Faker::Number.number(digits: 3) } # 成約価格
    score_contract { Faker::Number.within(range: 1..5) } # 売却価格の満足度
    contract_type { ContractType.all.map(&:id).sample } # 媒介契約の形態
    headline { Faker::Lorem.paragraph(sentence_count: 1) } # 見出し
    reason_sale { ReasonSale.all.map(&:id).sample } # 売却理由
    anxiety { Faker::Lorem.paragraph(sentence_count: 3) } # 売却時の不安
    reason_decision { Faker::Lorem.paragraph(sentence_count: 3) } # この会社に決めた理由
    score_store { Faker::Number.within(range: 1..5) } # 不動産会社の対応満足度
    reason_score { Faker::Lorem.paragraph(sentence_count: 3) } # 対応満足度の理由
    advice { Faker::Lorem.paragraph(sentence_count: 3) } # 今後売る人へ
    improvement { Faker::Lorem.paragraph(sentence_count: 3) } # 改善点

    assessment_user
    store
    city
  end
end
