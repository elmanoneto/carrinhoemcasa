require 'test_helper'

class Api::CepsControllerTest < ActionController::TestCase
  setup do
    @api_cep = api_ceps(:one)
  end

  test "should get index" do
    get :index
    it { response.response_code.should == 200 }
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create api_cep" do
    assert_difference('Api::Cep.count') do
      post :create, api_cep: { cep: @api_cep.cep, city: @api_cep.city, neighborhood: @api_cep.neighborhood, state: @api_cep.state, street: @api_cep.street }
    end

    assert_redirected_to api_cep_path(assigns(:api_cep))
  end

  test "should show api_cep" do
    get :show, id: @api_cep
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @api_cep
    assert_response :success
  end

  test "should update api_cep" do
    patch :update, id: @api_cep, api_cep: { cep: @api_cep.cep, city: @api_cep.city, neighborhood: @api_cep.neighborhood, state: @api_cep.state, street: @api_cep.street }
    assert_redirected_to api_cep_path(assigns(:api_cep))
  end

  test "should destroy api_cep" do
    assert_difference('Api::Cep.count', -1) do
      delete :destroy, id: @api_cep
    end

    assert_redirected_to api_ceps_path
  end
end
