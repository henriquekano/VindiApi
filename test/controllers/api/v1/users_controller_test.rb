require 'test_helper'
require 'webmock/minitest'

class Api::V1::UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:fine_user)
    @user2 = users(:other_fine_user)
    @endereco = enderecos(:fine_endereco)
    WebMock
      .stub_request(:get, /https:\/\/viacep\.com\.br\/ws\/[0-9]+\/json/)
      .with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'})
      .to_return(status: 200, headers: {content_type: 'application/json'}, body: "{\"cep\": \"01001-000\", \"logradouro\": \"Praça da Sé\", \"complemento\": \"lado ímpar\", \"bairro\": \"Sé\", \"localidade\": \"São Paulo\", \"uf\": \"SP\", \"unidade\": \"\", \"ibge\": \"3550308\", \"gia\": \"1004\"}")
  end

  teardown do
    User.delete_all
    Endereco.delete_all
  end

  test "should create user" do
    new_email = "emailnovo@novo.new"
    assert_difference('User.count', 1) do
      post :create, user: {nome: @user.nome, email: new_email, :endereco => { cep: @endereco.cep}}, format: :json
    end
    body = JSON.parse(response.body)
    assert_response :created
    assert_equal body["nome"], @user.nome, "nome diferente!"
    assert_equal body["email"], new_email, "email diferente!"
  end

  test "should show user" do
    get :show, id: @user, format: :json
    assert_response :ok
  end

  test "should update user" do
    new_email = "emailnovo@novo.new"
    patch :update, id: @user, user: { nome: @user2.nome, email: new_email }, format: :json
    body = JSON.parse(response.body)
    assert_equal body["nome"], @user2.nome, "nome diferente!"
    assert_equal body["email"], new_email, "email diferente!"
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user, format: :json
    end
    assert_response :ok
  end

end
