# frozen_string_literal: true

class CityController < ApplicationController
  before_action :set_city, only: [show]

  def show
    @stores = Store.where(city: @city)
  end

  private

  def set_city
    @prefecture = Prefecture.find(params[:area_id])
    @city = City.find(params[:id])
  end
end
