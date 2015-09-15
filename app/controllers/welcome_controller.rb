class WelcomeController < ApplicationController

  def index
    redirect_to new_user_path unless User.all.present?
    @articles = Article.all
  end

end
