class Chat < ApplicationRecord
    has_many :messages
    has_many :user_in_chats
    has_many :users, through: :user_in_chats

    
end
