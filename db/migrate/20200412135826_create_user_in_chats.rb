class CreateUserInChats < ActiveRecord::Migration[6.0]
  def change
    create_table :user_in_chats do |t|
      t.integer :chat_id
      t.integer :user_id

      t.timestamps
    end
  end
end
