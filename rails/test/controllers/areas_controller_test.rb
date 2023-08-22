
class AreasControllerTest < ActionDispatch::IntegrationTest
test "should get areas_id" do
  get "areas/1"
   assert_response :success
end
end
