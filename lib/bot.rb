require 'telegram/bot'
require_relative 'motivate.rb'
require_relative 'joke.rb'

class Bot < Motivate
    def initialize
        token = '1167629539:AAGQm4Kj0hUclTkDEKo_ow4X4T3V0N1CljE'
        Telegram::Bot::Client.run(token) do |bot|
            
            bot.listen do |message|
            case message.text
            when '/start'

                bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name} , welcome to motivation chat bot created by peter robert. Get motivated anytime.")

            when '/stop'

                bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
        
            when '/motivate'
                
              values =  Motivate.new
              value = values.select_random
              bot.api.send_message(chat_id: message.chat.id, text: "#{value["text"]}")

            when '/joke'
                
                values =  Joke.new
                value = values.make_the_request

                bot.api.send_message(chat_id: message.chat.id, text: "#{value["joke"]}")

            end
            end
        end

    end
end