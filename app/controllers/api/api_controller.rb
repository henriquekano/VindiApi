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

	def handle_cep_webservice_error(response)
      respond_to do |format|
        format.json { render json: { error: { cep: "invalid format" } }, :status => :ok }
      end
   	end

end