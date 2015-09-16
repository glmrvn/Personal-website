class UserController < ApplicationController

  before_action :find_elements,  only: [:new, :show, :nil_see_count_all]
  before_action :admin_have,     only: [:new]
  before_action :user_find,      only: [:show, :edit, :update]

  def show
    signed_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "User succesfull created"
    else
      render 'new'
    end
  end

  def edit
    signed_user
  end

  def update
    if @user.update(user_params)
      flash[:succes] = "User updated"
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
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

  def user_find
    @user = User.find(params[:id])
  end
  def signed_user
    redirect_to signin_url, notice: "Пожалуйста пройдите авторизацию" unless signed_in?
  end

  def user_params
    params.require(:user).permit( :email, :password, :password_confirmation )
  end

  def find_elements
    @users = User.all
    @articles = Article.all
  end

  def admin_have
    if @users.count >= 1
      redirect_to signin_url, notice: "Please sign in."
    end
  end

end
