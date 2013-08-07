require 'spec_helper'

describe UsersController do
  render_views

##### ERROR #####
#  describe "GET show" do

#    it "devrait reussir" do
#      get 'show', :id => "2"
#      response.should be_success
#    end

#  end
  describe "POST create" do
      describe "Error" do
          
          before(:each) do
            @attr = {:nom => "", :email => "", :password => "", :password_confirmation => ""}
          end
      
          it "ne devrait pas creer d'utilisateur" do
            lambda do
              post :create, :user => @attr
            end.should_not change(User, :count)
          end

          it "devrait avoir le bon titre" do
            post :create, :user => @attr
            response.should have_selector("title", :content => "MonApplication | Inscription")
          end

          it "devrait rendre la page new" do
            post :create, :user => @attr
            response.should render_template('new')  
          end  
          

      end

      describe "Success" do
          before(:each) do
            @attr = { :nom => "New user", 
                      :email => "user@example.com", 
                      :password => "foobar", 
                      :password_confirmation => "foobar"     }
          end

          it "devrait creer un utilisateur" do
           lambda do
            post :create, :user => @attr
            end.should change(User, :count).by(1)
          end

          it "devrait rediriger vers la page d'affichage de l'utilsateur" do
            post :create, :user => @attr
            response.should redirect_to(user_path(assigns(:user)))
          end

          it 'devrait avoir un message de bienvenue' do
            post :create, :user => @attr
            flash[:success].should =~/Bienvenue dans l'application test !/i
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
end
