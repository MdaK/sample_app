require 'spec_helper'

describe "LayoutLinks" do
	it "devrait trouver une page Accueil a /" do
		get '/'
		response.should have_selector('title', :content => 'Page d\'acceuil')
	end
	it "devrait trouver une page Contact a /contact" do
		get '/contact'

	end
	it "devrait trouver une page About a /about" do
		get '/about'
		response.should have_selector('title', :content => 'Qui sommes nous')
	end
	it "devrait trouver une page d'aide a /help" do
		get '/help'
		response.should have_selector('title', :content => 'Aide')
	end
end
