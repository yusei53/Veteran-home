# frozen_string_literal: true

class StoresController < ApplicationController
  def show
    @store = Store.find(params[:id])
    @company = @store.company
   end
end
