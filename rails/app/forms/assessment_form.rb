# frozen_string_literal: true

class AssessmentForm
  include ActiveModel::Model # validationなどを使えるように
  include ActiveModel::Attributes # "カラム属性が加えられる"

  # >> user info >>
  attribute :user_name, :string
  attribute :user_name_kana, :string
  attribute :user_tel, :string
  attribute :user_email, :string
  # << user info <<

  # >> property info >>
  attribute :branch_id, :string # 査定依頼を出す店舗名
  attribute :property_prefecture, :string # 物件の都道府県
  attribute :property_city, :string # 物件の市区
  attribute :property_address, :string # 物件の詳しい住所
  attribute :property_type, :integer
  attribute :property_building_area_unit, :integer
  attribute :property_exclusive_area, :float
  attribute :property_land_area, :float
  attribute :property_building_area, :float
  attribute :property_floor_area, :float
  attribute :url_param, :string
  attribute :property_room_plan, :integer
  attribute :property_constructed_year, :integer
  # << property info <<
end
