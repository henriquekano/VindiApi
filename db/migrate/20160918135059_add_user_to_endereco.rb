class AddUserToEndereco < ActiveRecord::Migration
  def change
    add_reference :enderecos, :user, index: true, foreign_key: true
  end
end
