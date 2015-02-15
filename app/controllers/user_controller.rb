class UserController < ApplicationController

	before_filter :signed_user,  only: [:index, :destroy, :show, :create]

	def show
		@user = User.find(1)
		@messages = Message.all
		@articles = Article.all
	end

	def index
	end

	private

	def signed_user
		redirect_to signin_url, notice: "Пожалуйста пройдите авторизацию" unless signed_in?		
	end
	
end
