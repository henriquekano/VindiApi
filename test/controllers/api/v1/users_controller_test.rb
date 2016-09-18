require 'test_helper'

class Api::V1::UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:fine_user)
    @user2 = users(:other_fine_user)
    @endereco = enderecos(:fine_endereco)
    WebMock
      .stub_request(:post, /https:\/\/viacep\.com\.br\/ws\/[0-9]+\/json/)
      .to_return(status: 200, headers: {content_type: 'application/json'}, body: "{\"cep\": \"01001-000\", \"logradouro\": \"Praça da Sé\", \"complemento\": \"lado ímpar\", \"bairro\": \"Sé\", \"localidade\": \"São Paulo\", \"uf\": \"SP\", \"unidade\": \"\", \"ibge\": \"3550308\", \"gia\": \"1004\"}")
  end

  test "should create user" do
    assert_difference('User.count', 1) do
      post :create, user: {nome: @user.nome, email: @user.email, cep: @endereco.cep}, format: :json
    end
    body = JSON.parse(response.body)
    assert_response :created
    assert_equal body["nome"], @user.nome, "nome diferente!"
    assert_equal body["email"], @user.email, "email diferente!"
  end

  test "should show user" do
    get :show, id: @user, format: :json
    assert_response :ok
  end

  test "should update user" do
    patch :update, id: @user, user: { nome: @user2.nome, email: @user2.email }, format: :json
    body = JSON.parse(response.body)
    assert_equal body["nome"], @user2.nome, "nome diferente!"
    assert_equal body["email"], @user2.email, "email diferente!"
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user, format: :json
    end
    assert_response :ok
  end

end
