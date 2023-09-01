# frozen_string_literal: true

class StoresController < ApplicationController
  def show
    @store = Store.find(params[:id])
    @company = @store.company

    original_reviews = OriginalReview.where(store: @store)
    @public_reviews = PublicReview.where(original_review: original_reviews)

    @score_contract = 0
    @score_store = 0
    @score_speed = 0
    @public_reviews.each do |r|
      @score_store += r.score_store / @public_reviews.length
      @score_contract += r.score_contract / @public_reviews.length
      @score_speed += r.score_speed / @public_reviews.length
    end
    @score_total = (@score_contract + @score_speed + @score_store) / 3

    # rubocop:disable all
    set_meta_tags(
      title: "#{@company.name}#{@store.name}"'の不動産売却体験談を公開中',
      description: "#{session[:assessment_city]['name']}" 'の不動産売却に強い不動産会社の体験談を紹介します。不動産の価格査定が素早く・簡単にできるのはもちろん、弊社で審査して厳選した、「土地・（中古）マンション・（中古）一戸建て」の売却・買取・査定が得意な、地元のおすすめの加盟不動産会社を比較検討できます。「信頼できる不動産会社を見つけるのが難しい」「自分が知っている不動産会社を信頼してよいかわからない」という方はぜひご活用ください。',
      keywords: '不動産売却,不動産査定,不動産会社,不動産仲介業者,不動産屋,住宅,住まい,マンション,一戸建て,土地,投資,家売る,ベテランすまい'
    )
    # rubocop:enable all
  end
end
