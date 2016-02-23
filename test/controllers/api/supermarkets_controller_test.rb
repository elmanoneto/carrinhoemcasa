require 'test_helper'

class Api::SupermarketsControllerTest < ActionController::TestCase
  setup do
    @api_supermarket = api_supermarkets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:api_supermarkets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create api_supermarket" do
    assert_difference('Api::Supermarket.count') do
      post :create, api_supermarket: { description: @api_supermarket.description, everyday: @api_supermarket.everyday, image: @api_supermarket.image, name: @api_supermarket.name }
    end

    assert_redirected_to api_supermarket_path(assigns(:api_supermarket))
  end

  test "should show api_supermarket" do
    get :show, id: @api_supermarket
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @api_supermarket
    assert_response :success
  end

  test "should update api_supermarket" do
    patch :update, id: @api_supermarket, api_supermarket: { description: @api_supermarket.description, everyday: @api_supermarket.everyday, image: @api_supermarket.image, name: @api_supermarket.name }
    assert_redirected_to api_supermarket_path(assigns(:api_supermarket))
  end

  test "should destroy api_supermarket" do
    assert_difference('Api::Supermarket.count', -1) do
      delete :destroy, id: @api_supermarket
    end

    assert_redirected_to api_supermarkets_path
  end
end
