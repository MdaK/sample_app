require 'spec_helper'

describe UsersController do
  render_views

  describe "GET show" do

    it "devrait reussir" do
      get 'show', :id => "2"
      response.should be_success
    end

  end

  describe "GET 'signup'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end

    it "doit avoir un bon titre" do
      get 'new'
      response.should have_selector("title", :content => "MonApplication | Inscription")
 	end
	end
end
