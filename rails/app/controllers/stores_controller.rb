# frozen_string_literal: true

class StoresController < ApplicationController
  def show
    @store = Store.find_by(ieul_store_id:params[:id])
    @company = @store.company

    original_reviews=OriginalReview.where(store: @store)
    @public_reviews=PublicReview.where(original_review: original_reviews)

    @score_contract=0
    @score_store=0
    @score_speed=0
    @public_reviews.each do |r|
      @score_store+=r.score_store
      @score_contract+=r.score_contract
      @score_speed+=r.score_speed
    end
    @score_contract/=@public_reviews.length
    @score_store/=@public_reviews.length
    @score_speed/=@public_reviews.length
    @score_total=(@score_contract+@score_speed+@score_store)/3
  end

end
