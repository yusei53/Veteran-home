require 'rails_helper'

RSpec.describe "Areas", type: :request do
  describe "GET /areas" do
    it "エリアページにアクセスする" do
      get "/areas/1"
      expect(response).to have_http_status(200)
    end
  end
end
