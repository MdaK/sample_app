class UsersController < ApplicationController
  
  def new
  	@titre = "Inscription"
  end

  def show
  	@user = User.find(params[:id])
  	@title = @user.nom
  end

  def app_params
    params.require(:user).permit(:nom, :email, :password, :password_confirmation)
  end
end
