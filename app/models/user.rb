
class User < ApplicationRecord
    has_many :messages
    has_many :user_in_chats
    has_many :chats, through: :user_in_chats
    has_secure_password

    validates :email, uniqueness: true
    validates :name, presence: true

    def get_chats
        
    end
end
