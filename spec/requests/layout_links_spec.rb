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
  it "devrait avoir le bon lien sur le layout" do
    visit root_path
    click_link "A Propos"
    response.should have_selector('title', :content => "Qui sommes nous")
    click_link "Aide"
    response.should have_selector('title', :content => "Aide")
    click_link "Contact"
    response.should have_selector('title', :content => 'Page de contact')
    click_link "Accueil"
    response.should have_selector('title', :content => 'Page d\'acceuil')
    click_link "S'inscrire!"
    response.should have_selector("title", :content => "Inscription")
  end
end


