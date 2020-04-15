class ChatsController < ApplicationController

    def index 
        chats = Chat.all
        render json: chats
    end 

    def create 
        chat = chat.new(chat_params)
        if chat.save
            serialized_data = ActiveModelSerializers::Adapter::JSON.new(
                ChatSerializer.new(chat)
            ).serailizable_hash
            ActionCable.server.broadcast 'chats_channel', serialized_data
            head :ok
        end
    end


    private

    def chat_params
        params.require(:chat).permit(:has_read)
    end
end
