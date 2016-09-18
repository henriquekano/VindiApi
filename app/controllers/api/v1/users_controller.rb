class Api::V1::UsersController < Api::ApiController
  respond_to :json

  def show
    user = User.find(params[:id])
    respond_to do |format|
      if user
        format.json { render json: user, status: :ok }
      else
        format.json { render json: user.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    new_user = User.new(user_params)
    respond_to do |format|
      if new_user.save
        format.json { render json: new_user, status: :created }
      else
        format.json { render json: new_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    user = User.find(params[:id])
    respond_to do |format|
      if user.destroy
        format.json { render :nothing => true, :status => :ok }
      else
        format.json { render json: user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def user_params
      params
        .require(:user)
        .permit(:email, :nome) 
    end
end  