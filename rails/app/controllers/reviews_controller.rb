# frozen_string_literal: true

class ReviewsController < ApplicationController
  def show
    @review = PublicReview.find(params[:id])
    @store = @review.original_review.store
    @company = @store.company
  end
end
