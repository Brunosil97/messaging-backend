class UserInChatsController < ApplicationController

    def index 
        userchats = UserInChat.all
        render json: userchats
    end 

    def create 
        userinchat = UserInChat.create(userinchat_params)
        render json: userinchat
    end 

    private 

    def userinchat_params 
        params.require(:user_in_chat).permit(:chat_id, :user_id)
    end
end
