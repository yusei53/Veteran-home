# frozen_string_literal: true

class AreasController < ApplicationController
  def show
    @prefecture = Prefecture.find(params[:id]) 
    @cities = @prefecture.cities 
  
  end
end
