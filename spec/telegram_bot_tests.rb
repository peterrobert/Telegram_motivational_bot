require_relative '../lib/motivate.rb'
require_relative '../lib/joke.rb'

RSpec.describe Motivate do
  describe '#make_the_request' do
    it 'should return json response when the request is sucessful' do
      request = Motivate.new
      request_json = request.make_the_request

      expect(request_json.class).to eql(Array)
    end

    it 'returns an array response should not be empty' do
      request = Motivate.new
      request_json = request.make_the_request
      expect(request_json.length).not_to eql(0)
    end
  end

  describe '#select_random' do
    it 'should return an Hash' do
      random = Motivate.new
      request_random = random.select_random

      expect(request_random.class).to eql(Hash)
    end

    it 'should return a key and a value' do
      random = Motivate.new
      request_random = random.select_random
      expect(request_random.length).to eql(2)
    end
  end
end
