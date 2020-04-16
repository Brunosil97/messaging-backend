class ChatsController < ApplicationController

    def index 
        chats = Chat.all
        render json: chats.to_json(:include => {:users => {:only => [:name, :email]}, :messages => {:only => [:content, :user_id]}})
    end

    def create
        chat = Chat.create(hasRead: params[:hasRead])
        render json: chat
    end 


    def show
        chat = Chat.find_by(id: params[:id])
        render json: chat.to_json(:include => {:users => {:only => [:name, :email]}, :messages => {:only => [:content, :user_id]}})
    end
end
