require 'test_helper'

class Users::ReservationsControllerTest < ActionDispatch::IntegrationTest
  test "should get complete" do
    get users_reservations_complete_url
    assert_response :success
  end

  test "should get show" do
    get users_reservations_show_url
    assert_response :success
  end

  test "should get edit" do
    get users_reservations_edit_url
    assert_response :success
  end

end
