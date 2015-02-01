class MessagesController < ApplicationController

	def new
		@message = Message.new		
	end

	def create
		@message = Message.new(message_params)
		@message.save
		redirect_to root_path
	end

	def index
		@messages = Message.all
		@articles  = Article.all
		
	end

	def show
		
	end

	private

    def message_params
	  params.require(:message).permit( :name,
			                           :text)
	end
end
