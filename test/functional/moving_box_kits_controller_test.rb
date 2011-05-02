require 'test_helper'

class MovingBoxKitsControllerTest < ActionController::TestCase
  setup do
    @moving_box_kit = moving_box_kits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:moving_box_kits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create moving_box_kit" do
    assert_difference('MovingBoxKit.count') do
      post :create, :moving_box_kit => @moving_box_kit.attributes
    end

    assert_redirected_to moving_box_kit_path(assigns(:moving_box_kit))
  end

  test "should show moving_box_kit" do
    get :show, :id => @moving_box_kit.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @moving_box_kit.to_param
    assert_response :success
  end

  test "should update moving_box_kit" do
    put :update, :id => @moving_box_kit.to_param, :moving_box_kit => @moving_box_kit.attributes
    assert_redirected_to moving_box_kit_path(assigns(:moving_box_kit))
  end

  test "should destroy moving_box_kit" do
    assert_difference('MovingBoxKit.count', -1) do
      delete :destroy, :id => @moving_box_kit.to_param
    end

    assert_redirected_to moving_box_kits_path
  end
end
