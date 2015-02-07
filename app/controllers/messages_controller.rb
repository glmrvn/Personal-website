class MessagesController < ApplicationController

	before_filter :signed_user,  only: [:index, :destroy, :show]

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

	def signed_user
		redirect_to signin_url, notice: "Пожалуйста пройдите авторизацию" unless signed_in?		
	end
end
