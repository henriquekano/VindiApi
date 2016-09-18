class AddEnderecoToUser < ActiveRecord::Migration
  def change
    add_reference :users, :endereco, index: true, foreign_key: true
  end
end
