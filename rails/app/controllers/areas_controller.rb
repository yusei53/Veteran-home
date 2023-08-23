# frozen_string_literal: true

class AreasController < ApplicationController
  def show
    @company = Company.find(params[:id])
  end
end
