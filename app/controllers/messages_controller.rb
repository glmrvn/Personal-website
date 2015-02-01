class MessagesController < ApplicationController

	http_basic_authenticate_with name: "admin", password: "admin", except: [:new, :create]

	def new
		@message = Message.new		
	end

	def create
		@message = Message.new(message_params)
		@message.save

	if @message.save
		flash[:success] = "Ваша сообщение успешно отправлено"
		redirect_to root_path
	else flash[:error] = "Сообщение не отправлено"
		redirect_to root_path
	end

	end

	def index
		@messages = Message.all
		@articles  = Article.all
	end

	def show
	end

	def destroy
		@message = Message.find(params[:id])
		@message.destroy
		redirect_to messages_path
		flash[:success] = "Сообщение удалено"	
	end

	private

    def message_params
	  params.require(:message).permit( :name,
			                           :text)
	end
end
