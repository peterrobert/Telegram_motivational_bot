require_relative '../lib/motivate.rb'
require_relative '../lib/joke.rb'

RSpec.describe Motivate do
  describe '#make_the_request' do
    let(:request) { Motivate.new }
    let(:request_json) { request.make_the_request }

    it 'should return json response when the request is sucessful' do
      expect(request_json.class).to eql(Array)
    end

    it 'returns an array response should not be empty' do
      expect(request_json.length).not_to eql(0)
    end
  end

  describe '#select_random' do
    let(:random) { Motivate.new }
    let(:request_random) { random.select_random }

    it 'should return an Hash' do
      expect(request_random.class).to eql(Hash)
    end

    it 'should return a key and a value' do
      expect(request_random.length).to eql(2)
    end
  end
end

RSpec.describe Joke do
  describe '#make_the_request' do
    let(:request) { Joke.new }
    let(:request_json) { request.make_the_request }
    it 'should return hash response when the request is sucessful' do
      expect(request_json.class).to eql(Hash)
    end
    it 'returns an array response should not be empty' do
      expect(request_json.length).not_to eql(0)
    end
  end
end
