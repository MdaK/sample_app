class UsersController < ApplicationController
  
  def new
  	@user = User.new
  	@titre = "Inscription"
  end

  def create
  	@user = User.new(params[:user])

  	if @user.save
		flash[:success] = "Bienvenue dans l'application test !"
  		redirect_to @user
  	else
  		@titre = "Inscription"
  		render "new"
  	end
  end

  def show

  	@user = User.find(params[:id])
  	flash[:success] = "Vous consultez  #{@user.nom}"
  	@title = @user.nom
  end

  def app_params
    params.require(:user).permit(:nom, :email, :password, :password_confirmation)
  end
end
