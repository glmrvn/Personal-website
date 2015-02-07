class SessionsController < ApplicationController

	before_filter :all_articles, only: [:new, :create]

	def new
		
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_to articles_path
		else
			flash.now[:error] = 'Ты кто такой? Давай до досвидания!'
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_path		
	end


	private

	def all_articles
		@articles  = Article.all
	end

end
