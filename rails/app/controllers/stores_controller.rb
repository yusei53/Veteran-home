# frozen_string_literal: true

class StoresController < ApplicationController
  def show
    @store = Store.find(ieul_store_id:params[:id])
    @company = @store.company
    original_reviews=OriginalReview.where(store:@store)
    @public_reviews = PublicReview.where(original_review:original_reviews)
  end
end
