class PagesController < ApplicationController
  def home
  	@titre = "Page d'acceuil"
  end

  def contact
  	@titre = "Page de contact"
  end

  def about
  	@titre = "Qui sommes nous"
  end
end
