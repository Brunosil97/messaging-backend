class User < ApplicationRecord
    has_many :messages
    has_many :user_in_chats
    has_many :chats, through: :user_in_chats
end
