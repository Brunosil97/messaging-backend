class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.boolean :hasRead

      t.timestamps
    end
  end
end
