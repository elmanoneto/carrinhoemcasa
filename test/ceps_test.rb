# require 'factory_girl_rails'
require 'test_helper'

class Api::CepsControllerTest < ActionController::TestCase
  # 
  # setup do
  #   @cep1 = FactoryGirl.create(:cep, cep: "58040-250", street: "Rua São Sebastião", neighborhood: "Torre", city: 'João Pessoa', state: 'Paraíba')
  #   @cep2 = FactoryGirl.create(:cep, cep: "58040-270", street: "Avenida Maroquinha Ramos", neighborhood: "Torre", city: 'João Pessoa', state: 'Paraíba')
  # end

  test "#index" do

    before do
      get :index
    end

    it { response.response_code.should == 200 }
  end

  test "#show" do

    before do
      get :show, id: @cep1.id
    end

    it { response.response_code.should == 200 }
  end

  test "#create" do

    before do
      request_payload = {
        cep: {
          cep: "58040-200", street: "Avenida Barão de Mamanguape",
          neighborhood: "Torre", city: 'João Pessoa', state: 'Paraíba'
        }
      }

      post :create, request_payload
    end

    it { response.response_code.should == 200 }
  end

  test "#update" do
    before do
      request_payload = {
        player: {
          cep: "58040-300", street: "Avenida Manoel Deodato",
          neighborhood: "Torre", city: 'João Pessoa', state: 'Paraíba'
        }
      }

      put :update, { id: @cep1.id }.merge(request_payload)
    end

    it { response.response_code.should == 200 }
  end

  test "#delete" do

   before do
     delete :destroy, id: @cep1.id
   end

   it { response.response_code.should == 200 }
  end
end
