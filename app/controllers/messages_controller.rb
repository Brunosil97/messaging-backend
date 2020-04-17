class MessagesController < ApplicationController

    def index 
        messages = Message.all
        render json: messages
    end
    def create
        # byebug
        messages = Message.create(message_params)
        render json: messages
    end 

    def new_chat_with_message

        chat = Chat.find_or_create_by(chat_params)
        user1 = UserInChat.create(chat_id: chat.id, user_id: params[:user_id])
        friend = User.find_by(email: params[:email])
        user2 = UserInChat.create(chat_id: chat.id, user_id: friend.id)
        message = Message.create(content: params[:content], user_id: params[:user_id], chat_id: chat.id)
        response = {:chat => chat, :user1 => user1, :friend => friend, :user2 => user2, :message => message}
        render json: response
    end

    private 

    def message_params
        params.require(:message).permit(:content, :chat_id, :user_id)
    end

    def chat_params
        params.require(:chat).permit(:hasRead)
    end 

end
