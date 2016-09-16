class CreateTelefones < ActiveRecord::Migration
  def change
    create_table :telefones do |t|
      t.string :numero

      t.timestamps null: false
    end
  end
end
