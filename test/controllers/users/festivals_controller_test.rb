require 'test_helper'

class Users::FestivalsControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get users_festivals_top_url
    assert_response :success
  end

  test "should get about" do
    get users_festivals_about_url
    assert_response :success
  end

  test "should get index" do
    get users_festivals_index_url
    assert_response :success
  end

  test "should get show" do
    get users_festivals_show_url
    assert_response :success
  end

end
