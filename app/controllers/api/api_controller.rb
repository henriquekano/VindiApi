class Api::ApiController < ApplicationController
	include HTTParty
	
	HTTParty::Basement.default_options.update(verify: false)
	def search_cep(cep)
		response = HTTParty.get("https://viacep.com.br/ws/#{cep}/json")
		if response.code == 200
			return response
		else
			return {}
		end
	end

end