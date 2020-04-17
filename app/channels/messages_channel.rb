class MessagesChannel < ApplicationCable::Channel
  def subscribed
    puts params[:chat_id]
    stream_from "message_#{params[:chat_id]}"
  end

  def send_message_to_user(data)
    if Message.create(content: data["content"], chat_id: data["chat_id"], user_id: data["user_id"])
      ActionCable.server.broadcast("message_#{params[:chat_id]}", data)
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  
  private 
  def message_params
      params.require(:message).permit(:content, :chat_id, :user_id)
  end

end
