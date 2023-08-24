# frozen_string_literal: true

require 'daru'

namespace :a2 do
  desc 'Register Company and Store'
  task company: :environment do
    csv_data = Daru::DataFrame.from_csv('csv/企業マスタ  - マスタ.csv')
    csv_length = csv_data.nrows

    # >> 企業の登録 >>
    p '===START Register Company==='
    (0..csv_length - 1).each do |idx|
      # 企業がまだ登録されていない場合は登録
      next unless Company.find_by(name: csv_data['企業名'][idx]).nil?

      record = {
        ieul_company_id: csv_data['ieul_企業id'][idx].to_i,
        name: csv_data['企業名'][idx]
      }
      p record
      Company.create(record)
    end
    p '===END Register Company==='
    # << 企業の登録 <<

    # >> 店舗の登録 >>
    p '===START Register Store==='
    store_records = []
    (0..csv_length - 1).each do |idx|
      record = {
        company_id: Company.find_by(name: csv_data['企業名'][idx]).id,
        name: csv_data['店舗名'][idx],
        ieul_store_id: csv_data['ieul_店舗id'][idx].to_i,
        logo_url: csv_data['ロゴURL'][idx],
        post_code: csv_data['郵便番号'][idx],
        city_id: City.find_by(name: csv_data['市区町村'][idx]).id,
        address: csv_data['以降住所'][idx],
        phone_number: csv_data['電話番号'][idx],
        fax_number: csv_data['FAX番号'][idx],
        open_time: csv_data['営業時間'][idx],
        holiday: csv_data['営業時間'][idx],
        catch_copy: csv_data['キャッチコピー'][idx],
        introduction: csv_data['紹介文'][idx]
      }
      store_records.push(record)
      p record
      p '------------------'
    end
    Store.create(store_records)
    p '===END Register Store==='
    # << 店舗の登録 <<
  end
end
