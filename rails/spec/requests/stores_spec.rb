require 'rails_helper'

RSpec.describe "Stores", type: :request do
  describe "GET /stores" do
    it "企業(店舗)ページにアクセスする" do
      get "/stores/2"
      expect(response).to have_http_status(200)
    end
  end
end
