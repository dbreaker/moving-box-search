require 'test_helper'

class MoveSizesControllerTest < ActionController::TestCase
  setup do
    @move_size = move_sizes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:move_sizes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create move_size" do
    assert_difference('MoveSize.count') do
      post :create, :move_size => @move_size.attributes
    end

    assert_redirected_to move_size_path(assigns(:move_size))
  end

  test "should show move_size" do
    get :show, :id => @move_size.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @move_size.to_param
    assert_response :success
  end

  test "should update move_size" do
    put :update, :id => @move_size.to_param, :move_size => @move_size.attributes
    assert_redirected_to move_size_path(assigns(:move_size))
  end

  test "should destroy move_size" do
    assert_difference('MoveSize.count', -1) do
      delete :destroy, :id => @move_size.to_param
    end

    assert_redirected_to move_sizes_path
  end
end
