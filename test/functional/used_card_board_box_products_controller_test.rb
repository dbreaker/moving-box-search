require 'test_helper'

class UsedCardBoardBoxProductsControllerTest < ActionController::TestCase
  setup do
    @used_card_board_box_product = used_card_board_box_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:used_card_board_box_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create used_card_board_box_product" do
    assert_difference('UsedCardBoardBoxProduct.count') do
      post :create, :used_card_board_box_product => @used_card_board_box_product.attributes
    end

    assert_redirected_to used_card_board_box_product_path(assigns(:used_card_board_box_product))
  end

  test "should show used_card_board_box_product" do
    get :show, :id => @used_card_board_box_product.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @used_card_board_box_product.to_param
    assert_response :success
  end

  test "should update used_card_board_box_product" do
    put :update, :id => @used_card_board_box_product.to_param, :used_card_board_box_product => @used_card_board_box_product.attributes
    assert_redirected_to used_card_board_box_product_path(assigns(:used_card_board_box_product))
  end

  test "should destroy used_card_board_box_product" do
    assert_difference('UsedCardBoardBoxProduct.count', -1) do
      delete :destroy, :id => @used_card_board_box_product.to_param
    end

    assert_redirected_to used_card_board_box_products_path
  end
end
