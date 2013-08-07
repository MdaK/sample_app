require 'spec_helper'

describe User do
 
 before (:each) do	
 	@attr = { :nom => "Example User", :email => "user@example.com"}
 end

 it "devrait creer une nouvelle instance avec des attributs valides!" do
 	User.create!(@attr)
 end

 it "exiger un nom" do
 	bad_guy = User.new(@attr.merge(:nom => ""))
 	bad_guy.should_not be_valid
 end

 it "exiger une adresse email" do
 	no_email_user = User.new(@attr.merge(:email => ""))
 	no_email_user.should_not be_valid
 end

 it "devrait rejeter les noms trop longs" do
 	nom = "a" * 51
 	long_nom = User.new(@attr.merge(:nom => nom))
 	long_nom.should_not be_valid
 end

 it "devrait accepter une adresse email valide" do
    adresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    adresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
   end
 end

 it "devrait rejeter une adresse email invalide" do
    adresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    adresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
   end
 end

 it "devrait rejeter un email existant" do
 	User.create!(@attr)
 	duplicate_email = User.new(@attr)
 	duplicate_email.should_not be_valid
 end
end
