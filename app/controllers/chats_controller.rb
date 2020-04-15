class ChatsController < ApplicationController

    def index 
        chats = Chat.all
        render json: chats.to_json(:include => {:users => {:only => [:name, :email]}})
    end
    def show
        chat = Chat.find_by(id: params[:id])
        render json: chat.to_json(:include => {:users => {:only => [:name, :email]}})
    end
end
