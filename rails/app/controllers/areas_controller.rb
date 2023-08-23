# frozen_string_literal: true

class AreasController < ApplicationController
  def show
    @store = Store.find(params[:id])
end
end
