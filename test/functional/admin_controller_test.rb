require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get view_users" do
    get :view_users
    assert_response :success
  end

end
