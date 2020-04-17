class ChatsChannel < ApplicationCable::Channel
  def subscribed
    puts params[:chat_id]
    stream_from "chat_#{params[:chat_id]}"
  end

  def send_message(data)
    ActionCable.server.broadcast("chat_#{params[:chat_id]}", data)
  end



  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
