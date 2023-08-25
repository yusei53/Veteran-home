require 'rails_helper'

RSpec.describe "TestStoreViews", type: :request do
  describe "GET /test_store_views" do
    it "works! (now write some real specs)" do
      store=FactoryBot.create(:store)
      get store_path(store)
      expect(response).to have_http_status(200)
    end
  end
end
