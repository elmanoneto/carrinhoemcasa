require 'test_helper'

class Api::ProductsControllerTest < ActionController::TestCase
  setup do
    @api_product = api_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:api_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create api_product" do
    assert_difference('Api::Product.count') do
      post :create, api_product: { image: @api_product.image, name: @api_product.name, price: @api_product.price }
    end

    assert_redirected_to api_product_path(assigns(:api_product))
  end

  test "should show api_product" do
    get :show, id: @api_product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @api_product
    assert_response :success
  end

  test "should update api_product" do
    patch :update, id: @api_product, api_product: { image: @api_product.image, name: @api_product.name, price: @api_product.price }
    assert_redirected_to api_product_path(assigns(:api_product))
  end

  test "should destroy api_product" do
    assert_difference('Api::Product.count', -1) do
      delete :destroy, id: @api_product
    end

    assert_redirected_to api_products_path
  end
end
