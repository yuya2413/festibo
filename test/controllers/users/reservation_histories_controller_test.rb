require 'test_helper'

class Users::ReservationHistoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get users_reservation_histories_show_url
    assert_response :success
  end

end
