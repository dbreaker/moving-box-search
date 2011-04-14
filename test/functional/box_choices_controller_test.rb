require 'test_helper'

class BoxChoicesControllerTest < ActionController::TestCase
  setup do
    @box_choice = box_choices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:box_choices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create box_choice" do
    assert_difference('BoxChoice.count') do
      post :create, :box_choice => @box_choice.attributes
    end

    assert_redirected_to box_choice_path(assigns(:box_choice))
  end

  test "should show box_choice" do
    get :show, :id => @box_choice.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @box_choice.to_param
    assert_response :success
  end

  test "should update box_choice" do
    put :update, :id => @box_choice.to_param, :box_choice => @box_choice.attributes
    assert_redirected_to box_choice_path(assigns(:box_choice))
  end

  test "should destroy box_choice" do
    assert_difference('BoxChoice.count', -1) do
      delete :destroy, :id => @box_choice.to_param
    end

    assert_redirected_to box_choices_path
  end
end
