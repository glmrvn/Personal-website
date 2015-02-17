class UserController < ApplicationController

	before_filter :signed_user,    only: [:index, :destroy, :show, :create]
	before_filter :find_elements,  only: [:index, :show,]

	def show
		@user = User.find(params[:id])
	end

	def index
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
