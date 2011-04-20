require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  test "should get view_users" do
    get :view_users
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
