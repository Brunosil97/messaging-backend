class MessagesController < ApplicationController

    def index 
        messages = Message.all
        render json: messages
    end 

    def create
        message = Message.new(message_params)
        chat = Chat.find(message_params[:chat_id])
        if message.save
            serialize_data = ActiveModelSerializers::Adapter::JSON.new(
                MessageSeralizer.new(message)
            ).serialiable_hash
            MessageChannel.broadcast_to chat, serialize_data
            head :ok
    end

    private

    def message_params
        params.require(:message).permit(:text, :conversation_id)
    end
end
