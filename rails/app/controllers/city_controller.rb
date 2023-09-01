# frozen_string_literal: true

class CityController < ApplicationController
  before_action :set_city, only: %i[show]

  def show
    @stores = @city.stores

    session[:assessment_city] = @city # パンクズにどこから来たかが必要なので一時保存

    @latest_public_reviews = []
    @stores.each do |store|
      latest_original_review = OriginalReview.where(stores: store).order(created_at: :desc).first
      latest_public_review = PublicReview.find_by(original_review: latest_original_review)
      @latest_public_reviews.push(latest_public_review)
    end

    set_meta_tags(
      title:"#{session[:assessment_city]["name"]}""の不動産売却体験談を公開中",
      description: "#{session[:assessment_city]["name"]}" "の不動産売却に強い不動産会社の体験談を紹介します。不動産の価格査定が素早く・簡単にできるのはもちろん、弊社で審査して厳選した、「土地・（中古）マンション・（中古）一戸建て」の売却・買取・査定が得意な、地元のおすすめの加盟不動産会社を比較検討できます。「信頼できる不動産会社を見つけるのが難しい」「自分が知っている不動産会社を信頼してよいかわからない」という方はぜひご活用ください。",
      keywords: "不動産売却,不動産査定,不動産会社,不動産仲介業者,不動産屋,住宅,住まい,マンション,一戸建て,土地,投資,家売る,ベテランすまい"
    )
  end

  private

  def set_city
    @prefecture = Prefecture.find(params[:area_id])
    @city = City.find(params[:id])
    @cities = @prefecture.cities
  end
end
