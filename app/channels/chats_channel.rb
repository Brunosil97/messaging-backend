class ChatsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat"
  end

  def send_message(data)
    # chat = Chat.create()
    ActionCable.server.broadcast("chat_#{params[:chat_id]}", data)
  end



  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
