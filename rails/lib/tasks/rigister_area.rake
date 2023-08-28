# frozen_string_literal: true

# 都道府県、市区町村の登録

namespace :register_area do
  # >> 都道府県の登録 >>
  desc 'Register prefecture'
  task prefecture: :environment do
    csv_data = Daru::DataFrame.from_csv('csv/住所マスタ - 都道府県.csv')

    csv_length = csv_data.nrows
    (0..csv_length - 1).each do |idx|
      prefecture_record = {
        name: csv_data['name'][idx],
        prefecture_id: csv_data['id'][idx].to_i
      }
      Prefecture.find_or_create_by!(prefecture_record)
      p prefecture_record
    end
  end
  # << 都道府県の登録 <<

  # >> 市区町村の登録 >>
  desc 'Register city'
  task city: :environment do
    csv_data = Daru::DataFrame.from_csv('csv/住所マスタ - 市区町村.csv')

    csv_length = csv_data.nrows
    (0..csv_length - 1).each do |idx|
      city_record = {
        name: csv_data['name'][idx],
        city_id: csv_data['id'][idx].to_i,
        prefecture_id: Prefecture.find_by!(prefecture_id: csv_data['prefecture_id'][idx]).id,
        yomi: csv_data['yomi'][idx]
      }
      City.find_or_create_by!(city_record)
      p city_record
    end
  end
  # << 市区町村の登録 <<
end
