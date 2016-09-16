require 'test_helper'

class TelefoneTest < ActiveSupport::TestCase
  test "telefone numero chould have 8 numbers" do
    phone = Telefone.new
    phone.numero = "12345678"
    assert phone.valid?
    assert phone.save
  end

  test "telefone numero chould have 9 numbers" do
    phone = Telefone.new
    phone.numero = "123456789"
    assert phone.valid?
    assert phone.save
  end

  test "telefone numero can't have 7 numbers" do
    phone = Telefone.new
    phone.numero = "1234567"
    assert_not phone.valid?
    assert_not phone.save
  end

  test "telefone numero can't have 10 numbers" do
    phone = Telefone.new
    phone.numero = "1234567890"
    assert_not phone.valid?
    assert_not phone.save
  end
end
