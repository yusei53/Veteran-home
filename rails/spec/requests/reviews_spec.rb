require 'rails_helper'

RSpec.describe "Reviews", type: :request do
  describe "GET /reviews" do
    it "口コミ詳細ページにアクセスする" do
      get "/reviews/1"
      expect(response).to have_http_status(200)
    end
  end
end
