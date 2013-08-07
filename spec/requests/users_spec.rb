require 'spec_helper'

describe "Users" do
  
  	describe "une description" do

  	 	describe "ratee" do
  	 		it "ne devrait pas creer un nouvel utilisateur" do
  	 		lambda do
  	 			visit signup_path
  	 			fill_in "Nom",					:width => ""
  	 			fill_in "Email",				:width => ""
  	 			fill_in "Mot de passe",			:width => ""
  	 			fill_in "Confirmation", 		:width => ""
  	 			click_button
  	 			response.should render_template('users/new')
  	 			response.should have_selector("div#error_explanation") 
  	 		end.should_not change(User, :count)
  	 		end
  	 	end	

  	 	#ERROR
  	 	describe "reussie" do
  	 		it "devrait creer un nouvel utilisateur" do
  	 		lambda do
  	 			visit signup_path
  	 			fill_in "nom",					:width => "Par-Exemple"
  	 			fill_in "email",				:width => "parexample@exemple.com"
  	 			fill_in "mot de passe",			:width => "soleil"
  	 			fill_in "confirmation", 		:width => "soleil"
  	 			click_button
  	 			response.should have_selector("div.flash.success", :content => "Bienvenue dans l'application test !")
  	 			response.should render_template('users/show')
  	 		end.should change(User, :count).by(1)
  	 		end
  	 	end	

  	end

end
