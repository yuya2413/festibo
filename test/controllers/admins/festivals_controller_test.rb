require 'test_helper'

class Admins::FestivalsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_festivals_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_festivals_show_url
    assert_response :success
  end

  test "should get new" do
    get admins_festivals_new_url
    assert_response :success
  end

  test "should get edit" do
    get admins_festivals_edit_url
    assert_response :success
  end

end
