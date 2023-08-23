#都道府県、市区町村の登録

namespace :register_area do

    #>> 都道府県の登録 >>
    desc "Register prefecture"
    task :prefecture => :environment do

        csv_data=Daru::DataFrame.from_csv("csv/住所マスタ - 都道府県.csv")

        prefecture_records=[]
        csv_length=csv_data.nrows
        for idx in (0..csv_length-1) do
            prefecture_record={
                name: csv_data["name"][idx],
                prefecture_id: csv_data["id"][idx].to_i
            }
            prefecture_records.push(
                prefecture_record
            )
            p prefecture_record
        end
        Prefecture.create(prefecture_records)
    end
    #<< 都道府県の登録 <<

    #>> 市区町村の登録 >>
    desc "Register city"
    task :city=>:environment do
        
        csv_data=Daru::DataFrame.from_csv("csv/住所マスタ - 市区町村.csv")

        city_records=[]
        csv_length=csv_data.nrows
        for idx in (0..csv_length-1) do
            city_record={
                name: csv_data["name"][idx],
                city_id: csv_data["id"][idx].to_i,
                prefecture_id: Prefecture.find_by(ieul_id:csv_data["prefecture_id"][idx]).id,
                yomi: csv_data["yomi"][idx]
            }
            city_records.push(city_record)
            city=City.create(city_record)
            p city
        end
    end
    #<< 市区町村の登録 <<

end