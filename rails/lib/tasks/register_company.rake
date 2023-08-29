# frozen_string_literal: true

require 'daru'
require 'ruby-progressbar'

namespace :register_company do
  desc 'Register Company and Store'
  task company: :environment do
    csv_data = Daru::DataFrame.from_csv('csv/企業マスタ  - マスタ.csv')
    csv_length = csv_data.nrows
    pb = ProgressBar.create(total: csv_length)

    # >> 企業の登録 >>
    puts '***START Register Company***'
    (0..csv_length - 1).each do |idx|
      record = {
        ieul_company_id: csv_data['ieul_企業id'][idx].to_i,
        name: csv_data['企業名'][idx]
      }
      Company.find_or_create_by!(record)
      pb.increment
    end
    pb.finish
    puts '***END Register Company***'
    # << 企業の登録 <<

    # >> 店舗の登録 >>
    puts ''
    puts '***START Register Store and AssessmentArea***'
    pb = ProgressBar.create(total: csv_length)
    (0..csv_length - 1).each do |idx|
      store_record = {
        company_id: Company.find_by!(name: csv_data['企業名'][idx]).id,
        name: csv_data['店舗名'][idx],
        ieul_store_id: csv_data['ieul_店舗id'][idx].to_i,
        logo_url: csv_data['ロゴURL'][idx],
        post_code: csv_data['郵便番号'][idx],
        city_id: City.find_by!(name: csv_data['市区町村'][idx]).id,
        address: csv_data['以降住所'][idx],
        phone_number: csv_data['電話番号'][idx],
        fax_number: csv_data['FAX番号'][idx],
        open_time: csv_data['営業時間'][idx],
        holiday: csv_data['定休日'][idx],
        catch_copy: csv_data['キャッチコピー'][idx],
        introduction: csv_data['紹介文'][idx]
      }
      store = Store.find_or_create_by!(store_record)

      # >> 査定可能エリアの登録 >>
      assessment_area_ids = csv_data['査定依頼可能エリア'][idx].split(',').map(&:to_i)
      assessment_area_ids.each do |area_id|
        assessment_record = {
          city_id: City.find_by!(city_id: area_id).id,
          store_id: store.id
        }
        AssessmentArea.find_or_create_by!(assessment_record)
      end
      # << 査定可能エリアの登録 <<

      pb.increment
    end
    pb.finish
    puts '***END Register Store***'
    # << 店舗の登録 <<
  end
end
