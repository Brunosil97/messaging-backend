# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

bruno = User.create(name: "Bruno", email: "bruno@gmail.com", password: "123", profileImage: ".jpg")
amy = User.create(name: "Amy", email: "amy@gmail.com", password: "456", profileImage: ".jpg2")
simon = User.create(name: "simon", email: "simon@gmail.com", password: "789", profileImage: ".jpg2")

chat1 = Chat.create(hasRead: false)
chat2 = Chat.create(hasRead: false)
chat3 = Chat.create(hasRead: false)

chatroom1 = UserInChat.create(chat_id: chat1.id, user_id: bruno.id)
chatroom2 = UserInChat.create(chat_id: chat1.id, user_id: amy.id)

chatroom3 = UserInChat.create(chat_id: chat2.id, user_id: bruno.id)
chatroom4 = UserInChat.create(chat_id: chat2.id, user_id: simon.id)

chatroom5 = UserInChat.create(chat_id: chat3.id, user_id: amy.id)
chatroom6 = UserInChat.create(chat_id: chat3.id, user_id: simon.id)

message1 = Message.create(content: "hello amy", user_id: bruno.id, chat_id: chat1.id)
message2 = Message.create(content: "hello bruno", user_id: amy.id, chat_id: chat1.id)

message3 = Message.create(content: "hello simon", user_id: bruno.id, chat_id: chat2.id)
message4 = Message.create(content: "hello bruno", user_id: simon.id, chat_id: chat2.id)

message3 = Message.create(content: "hello simon", user_id: amy.id, chat_id: chat3.id)
message4 = Message.create(content: "hello amy", user_id: simon.id, chat_id: chat3.id)
