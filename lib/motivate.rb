require 'telegram/bot'
require 'net/http'
require 'json'

class Motivate

    def make_the_request
        url = 'https://type.fit/api/quotes'

        uri = URI(url)
        response = Net::HTTP.get(uri)
        response = JSON.parse(response)
        response

    end

    def select_random (e = make_the_request)
        values = e.sample(1)
        values
    end

    def attach_to_telegram(value = select_random )

        # token = '1167629539:AAGQm4Kj0hUclTkDEKo_ow4X4T3V0N1CljE'
        # Telegram::Bot::Client.run(token) do |bot|
        #     bot.listen do |message|
        #         bot.api.send_message(chat_id: message.chat.id, text: "#{value[:text]}")
        #     end
        # end
        value[:text]
       
    end
end


motive = Motivate.new
motive.attach_to_telegram




