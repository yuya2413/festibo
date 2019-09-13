require 'test_helper'

class Admins::HotelsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_hotels_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_hotels_show_url
    assert_response :success
  end

  test "should get new" do
    get admins_hotels_new_url
    assert_response :success
  end

  test "should get edit" do
    get admins_hotels_edit_url
    assert_response :success
  end

end
