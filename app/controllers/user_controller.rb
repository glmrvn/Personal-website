class UserController < ApplicationController

  before_action :find_elements,  only: [:show, :nil_see_count_all]

  def show
    signed_user
    @user = User.find(params[:id])
  end

  def admin_show
    redirect_to user_path(current_user) if signed_in?
    else signed_user
  end

  def nil_see_count_all
    @articles.update_all(see_count:0)
    redirect_to user_path(current_user), notice: "Index of see succes deleted"
  end


  private

  def signed_user
    redirect_to signin_url, notice: "Пожалуйста пройдите авторизацию" unless signed_in?
  end

  def find_elements
    @messages = Message.all
    @articles = Article.all
  end

end
