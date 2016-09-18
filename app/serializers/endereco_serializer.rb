class EnderecoSerializer < ActiveModel::Serializer
  attributes :id, :cep, :logradouro, :complemento, :bairro, :localidade, :uf, :unidade, :ibge, :gia
end
