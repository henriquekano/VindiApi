class Endereco < ActiveRecord::Base
	validates_presence_of :cep, :logradouro
end
