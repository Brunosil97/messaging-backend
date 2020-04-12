class UserInChatsController < ApplicationController

    def index 
        userchats = UserInChat.all
        render json: userchats
    end 
end
