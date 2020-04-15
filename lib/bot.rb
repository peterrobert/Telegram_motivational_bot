# rubocop:disable Metrics/MethodLength
# rubocop:disable Layout/LineLength
# rubocop:disable Style/RedundantInterpolation
require 'telegram/bot'
require_relative 'motivate.rb'
require_relative 'joke.rb'

class Bot
  def initialize
    token = '1167629539:AAGQm4Kj0hUclTkDEKo_ow4X4T3V0N1CljE'

    Telegram::Bot::Client.run(token) do |bot|
    bot.listen do |message|
      case message.text
      when '/start'

      bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name} , welcome to motivation chat bot created by peter robert.Use  /start,  /stop , /motivate or /joke in order to use the bot ")

      when '/stop'

      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}", date: message.date)
      when '/motivate'
      values = Motivate.new
      value = values.select_random
      bot.api.send_message(chat_id: message.chat.id, text: "#{value['text']}", date: message.date)

      when '/joke'
      values = Joke.new
      value = values.make_the_request

      bot.api.send_message(chat_id: message.chat.id, text: "#{value['joke']}", date: message.date)

      else

      bot.api.send_message(chat_id: message.chat.id, text: "Invalid entry, #{message.from.first_name}, you need to use  /start,  /stop , /motivate or /joke")
      end
    end
    end
  end
end

# rubocop: enable Metrics/MethodLength
# rubocop: enable Layout/LineLength
# rubocop: enable Style/RedundantInterpolation
