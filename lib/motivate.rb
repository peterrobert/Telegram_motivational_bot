require 'telegram/bot'
require 'net/http'
require 'json'
require_relative 'bot.rb'

class Motivate
  @values = nil

  def initialize
    @values = make_the_request
  end

  def make_the_request
    url = 'https://type.fit/api/quotes'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    response
  end

  def select_random
    @values = @values.sample
    @values
  end
end
