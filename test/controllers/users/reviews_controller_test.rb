require 'test_helper'

class Users::ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_reviews_new_url
    assert_response :success
  end

end
