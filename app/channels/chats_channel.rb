class ChatsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chats_channel"
  end

  def test_methods
    ActionCable.server.broadcast("chats_channel", 'hello from test')
  end
  
  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
