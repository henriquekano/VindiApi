class Api::ApiController < ApplicationController

	rescue_from ActionController::ParameterMissing, :with => :parameter_missing_handler
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found_handler

  def default
    respond_to do |format|
      format.json { render :nothing => true, status: :not_found }
    end
  end

  def parameter_missing_handler(exception)
    respond_to do |format|
      format.json { render json: { exception.param => ["object '#{exception.param}' missing parameters"]}, status: :unprocessable_entity }
    end
  end

  def record_not_found_handler(exception)
    respond_to do |format|
      format.json { render json: { id: [exception.message ] }, status: :not_found }
    end
  end

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