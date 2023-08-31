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
  attribute :branch_id, :integer # 査定依頼を出す店舗名
  attribute :property_prefecture_id, :integer # 物件の都道府県
  attribute :property_city_id, :integer # 物件の市区
  attribute :property_address, :string # 物件の詳しい住所
  attribute :property_type, :integer
  # attribute :property_building_area_unit, :integer
  attribute :property_exclusive_area, :float
  attribute :property_land_area, :float
  attribute :property_building_area, :float
  # attribute :property_floor_area, :float
  attribute :url_param, :string
  attribute :property_room_plan, :integer
  attribute :property_constructed_year, :integer
  # << property info <<

  # >> validation >>
  validates :user_name, presence: true, length: { maximum: 32 }, user_name: true
  validates :user_name_kana, presence: true, length: { maximum: 64 }, user_name: true
  validates :user_tel, presence: true, length: { minimum: 10, maximum: 11 }
  validates :user_email, presence: true, length: { maximum: 100 }, email: true
  validates :branch_id, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :property_prefecture_id, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :property_city_id, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :property_address, presence: true
  validates :property_type, presence: true, inclusion: { in: Property.all.map(&:id) }
  # validates :property_building_area_unit, presence: true, inclusion: { in: BuildingAreaUnit.all.map(&:id) }
  validates :property_exclusive_area, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :property_land_area, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :property_building_area, presence: true, numericality: { greater_than_or_equal_to: 0 }
  # validates :property_floor_area, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :url_param, presence: true
  validates :property_room_plan, presence: true, inclusion: { in: PropertyRoomPlan.all.map(&:id) }
  validates :property_constructed_year, presence: true,
                                        numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  # << validation <<
end
