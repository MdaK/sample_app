require 'spec_helper'

describe UserController do
  render_views

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
