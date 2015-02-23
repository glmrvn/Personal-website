class UserController < ApplicationController

	before_filter :signed_user,    only: [:index, :destroy, :show, :create]
	before_filter :find_elements,  only: [:index, :show]

	def show
		@user = User.find(params[:id])
	end

	def admin_show
		if signed_in?
			# admin = User.find_by_id(params[:user_id])
			redirect_to user_path(current_user)
		else
			signed_user
		end
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
