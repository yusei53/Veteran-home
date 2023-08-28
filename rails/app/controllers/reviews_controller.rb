# frozen_string_literal: true

class ReviewsController < ApplicationController
  def show
    @review = PublicReview.find(params[:id])
    @detail_review = @review.original_review
    @store = @review.original_review.store
    @company = @store.company
    @reason_sale = ReasonSale.find(@review.reason_sale)
    @num_sale = NumSale.find(@review.num_sale)
  end
end
