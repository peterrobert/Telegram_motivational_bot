require 'telegram/bot'
class Bot
def initialize
    token = '1167629539:AAGQm4Kj0hUclTkDEKo_ow4X4T3V0N1CljE'
    Telegram::Bot::Client.run(token) do |bot|
        bot.listen do |message|
          case message.text
          when '/start'
            bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
          when '/stop'
            bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    
          when '/fuck'
            bot.api.send_message(chat_id: message.chat.id, text: "fuck you man, #{message.from.first_name}")
          end
        end
  
    end
end  
end