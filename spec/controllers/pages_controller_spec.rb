require 'spec_helper'

describe PagesController do
  render_views

  before(:each) do
   message =  "doit avoir le bon titre"
  end
  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end
    
    it "doit avoir le bon titre" do
      get 'home'
      response.should have_selector("title", :content => "MonApplication | Page d'acceuil")
    end  

  end

  describe "GET 'contact'" do
    it "returns http success" do
      get 'contact'
      response.should be_success
    end

    it "doit avoir le bon titre" do
      get 'contact'
      response.should have_selector("title", :content => "MonApplication | Page de contact")
    end  
  end

  describe "GET 'about'" do 
    it "devrait reussir" do
      get 'about'
      response.should be_success
    end

    it "doit avoir le bon titre" do
      get 'about'
      response.should have_selector("title", :content => "MonApplication | Qui sommes nous")
    end  
  end

  describe "GET 'help'" do
    it "devrait reussir" do
      get 'help'
      response.should be_success
    end

    it "doit avoir le bon titre" do
      get 'help'
      response.should have_selector("title", :content => "MonApplication | Aide")
    end

    it "devrait avoir un attribut  mot de passe crypté" do
      @user.should respond_to(:encrypted_password)
    end

  end
end
