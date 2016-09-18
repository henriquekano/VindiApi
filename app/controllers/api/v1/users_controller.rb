class Api::V1::UsersController < Api::ApiController
  respond_to :json
  before_action :find_user, only: [:show, :destroy]

  def show
    user = User.find(user_params_delete_and_show)
    respond_to do |format|
      if user
        format.json { render json: user, status: :ok }
      else
        format.json { render json: user.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    new_user = User.new(email: user_params_insert[:email], nome: user_params_insert[:nome])
    service_response = search_cep(user_params_insert[:endereco][:cep])
    new_endereco = Endereco.new(service_response)
    new_user.endereco = new_endereco
    respond_to do |format|
      if new_user.save
        format.json { render json: new_user, status: :created }
      else
        format.json { render json: new_user.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
    user = User.find(user_params_delete_and_show)
    respond_to do |format|
      if user.destroy
        format.json { render :nothing => true, :status => :ok }
      else
        format.json { render json: user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    updated_user = User.find(params[:id])
    req_params = user_params_update
    if req_params.has_key? :cep
      updated_endereco = Endereco.new(search_cep(user_params_update[:endereco][:cep]))
      updated_user.endereco = updated_endereco
    end
    if req_params.has_key? :email
      updated_user.email = req_params[:email]
    end
    if req_params.has_key? :nome
      updated_user.nome = req_params[:nome]
    end
    respond_to do |format|
      if updated_user.save
        format.json { render json: updated_user, :status => :ok }
      else
        format.json { render json: updated_user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def user_params_insert
      params
        .require(:user)
        .permit(:email, :nome, {:endereco => :cep}) 
    end

    def user_params_update
      params
        .require(:user)
        .permit(:email, :nome, {:endereco => :cep}) 
    end

    def user_params_delete_and_show
      params
        .require(:id)
    end

    def find_user
      begin
        user = User.find(user_params_delete_and_show)
      rescue ActiveRecord::RecordNotFound => e
        respond_to do |format|
          format.json { render json: { error: [ id: e.message ] }, status: :not_found }
        end
      end
    end

end  