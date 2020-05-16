class MessagesController < ApplicationController

    def index 
        messages = Message.all
        render json: messages
    end
    
    def create
        messages = Message.create(message_params)
        render json: messages
    end 

    private 

    def message_params
        params.require(:message).permit(:content, :chat_id, :user_id)
    end

    def chat_params
        params.require(:chat).permit(:hasRead)
    end 

end
