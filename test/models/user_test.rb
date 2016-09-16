require 'test_helper'

class UserTest < ActiveSupport::TestCase

  fixtures :all

  test "user should have a name" do
    user = users(:fine_user)
    user.nome = nil
    assert_not user.valid?
    assert_not user.save

    user.nome = "Nome valido"
    assert user.valid?
    assert user.save
    
  end

  test "user should have a valid email" do
    user = users(:fine_user)
    user.email = "email nao valido"
    assert_not user.valid?
    assert_not user.save

    user.email = "email@valido.com"
    assert user.valid?
    assert user.save
  end

end
