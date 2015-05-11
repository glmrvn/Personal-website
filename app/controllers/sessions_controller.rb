class SessionsController < ApplicationController

  def new
    redirect_to user_path(current_user) if signed_in?
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    else
      flash.now[:error] = 'Ты кто такой? Давай до досвидания!'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
