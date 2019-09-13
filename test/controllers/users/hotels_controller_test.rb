require 'test_helper'

class Users::HotelsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_hotels_index_url
    assert_response :success
  end

  test "should get show" do
    get users_hotels_show_url
    assert_response :success
  end

end
