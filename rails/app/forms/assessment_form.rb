# frozen_string_literal: true

class AssessmentForm
  include ActiveModel::Model # validationなどを使えるように
  include ActiveModel::Attributes # "カラム属性が加えられる"

  attribute :name, :string
  attribute :yomi, :string
  attribute :phone_number, :string
  attribute :email, :string

  attribute :branch, :integer # 査定依頼を出す店舗名
  attribute :property_city, :integer # 物件の市区
  attribute :property_address, :string # 物件の詳しい住所
  attribute :property_type, :integer
end
