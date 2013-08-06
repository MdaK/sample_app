require 'spec_helper'

describe PagesController do
  render_views

  before(:each) do
   @message =  "doit avoir le bon titre"
  end
  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end
    
    it @message do
      get 'home'
      response.should have_selector("title", :content => "Page d'acceuil")
    end  

  end

  describe "GET 'contact'" do
    it "returns http success" do
      get 'contact'
      response.should be_success
    end

    it "doit avoir le bon titre" do
      get 'contact'
      response.should have_selector("title", :content => "Page de contact")
    end  
  end

  describe "GET 'about'" do 
    it "devrait reussir" do
      get 'about'
      response.should be_success
    end

    it "doit avoir le bon titre" do
      get 'about'
      response.should have_selector("title", :content => "Qui sommes nous")
    end  
  end

  describe "GET 'aide'" do
    it "devrait reussir" do
      get 'aide'
      response.should be_success
    end

    it "doit avoir le bon titre" do
      get 'aide'
      response.should have_selector("title", :content => "Aide")
    end
  end
end
