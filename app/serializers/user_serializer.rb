class UserSerializer < ActiveModel::Serializer
  attributes :id, :nome, :email, :endereco
end
