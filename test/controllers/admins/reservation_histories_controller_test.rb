require 'test_helper'

class Admins::ReservationHistoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admins_reservation_histories_show_url
    assert_response :success
  end

end
