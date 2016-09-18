class Api::ApiController < ApplicationController
	include HTTParty
	
	HTTParty::Basement.default_options.update(verify: false)
	def search_cep(cep)
		response = HTTParty.get("https://viacep.com.br/ws/#{cep}/json")
		if response.headers["content-type"] == "application/json"
			return response
		else
			return {}
		end
	end

end