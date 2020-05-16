class ChatsController < ApplicationController

    def index 
        chats = Chat.all
        render json: chats.to_json(:include => {:users => {:only => [:name, :email]}, :messages => {:only => [:content, :user_id]}})
    end

    def create
        chat = Chat.create(hasRead: false)
        render json: chat
    end 

    def new_chat
      
        chat = Chat.create(hasRead: false)
        friend = User.find_by(email: params[:email])
        user = User.find_by(id: params[:user_id])
        if (!friend || !chat || !user) 
            render json: {error: "User doesn't exist, try again"}
        else
            user1 = UserInChat.create(chat_id: chat.id, user_id: params[:user_id])
            user2 = UserInChat.create(chat_id: chat.id, user_id: friend.id)
            response = {:chat => chat, :user => user, :friend => friend, :user1 => user1, :user2 => user2}
            render json: response
        end
    end


    def show
        chat = Chat.find_by(id: params[:id])
        render json: chat.to_json(:include => {:users => {:only => [:name, :email]}, :messages => {:only => [:content, :user_id]}})
    end
end
