require 'test_helper'

class Api::V1::UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:fine_user)
  end

  test "should create user" do
    assert_difference('User.count', 1) do
      post :create, user: { nome: @user.nome, email: @user.email }, format: :json
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

  # test "should update user" do
  #   patch :update, id: @user, user: {  }
  #   assert_redirected_to user_path(assigns(:user))
  # end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user, format: :json
    end
    assert_response :ok
  end

end
