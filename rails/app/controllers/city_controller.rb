# frozen_string_literal: true

class CityController < ApplicationController
  before_action :set_city, only: %i[show]

  def show
    @stores = Store.where(city: @city)

    @latest_public_reviews = []
    @stores.each do |store|
      latest_original_review = OriginalReview.where(store:).order(created_at: :desc).first
      latest_public_review = PublicReview.find_by(original_review: latest_original_review)
      @latest_public_reviews.push(latest_public_review)
    end
  end

  private

  def set_city
    @prefecture = Prefecture.find(params[:area_id])
    @city = City.find(params[:id])
  end
end
