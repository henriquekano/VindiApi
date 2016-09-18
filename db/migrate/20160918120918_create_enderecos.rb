class CreateEnderecos < ActiveRecord::Migration
  def change
    create_table :enderecos do |t|
      t.string :cep
      t.string :logradouro
      t.string :complemento
      t.string :bairro
      t.string :localidade
      t.string :uf
      t.string :unidade
      t.string :ibge
      t.string :gia

      t.timestamps null: false
    end
  end
end
