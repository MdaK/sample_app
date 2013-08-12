class SessionsController < ApplicationController
  	def new
  		@titre = "S'identifier"
  	end

  	def create

  		user = User.authenticate(params[:session][:email], 
                               params[:session][:password])

  		if user.nil?
  			flash.now[:error] = "Oops ! Erreur d'identification"
  			@titre = "S'identfier"
  			render 'new'
  		else
  			sign_in user
       # redirect_to user
  		
  		end
	end

  	def destroy

  	end
end
