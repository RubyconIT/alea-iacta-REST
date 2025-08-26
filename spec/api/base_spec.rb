require_relative '../spec_helper'

RSpec.describe API::Base do
  def app
    API::Base
  end

  describe 'GET /api/ping' do
    it 'returns ping' do
      get 'api/ping'
      expect(last_response.status).to eq(200)
      expect(JSON.parse(last_response.body)).to eq({ 'answer' => 'pong' })
    end
  end

  describe 'GET /api/roll' do
    it 'returns a dice roll result' do
      get '/api/roll'
      expect(last_response.status).to eq(200)
      response = JSON.parse(last_response.body)["result"]
      expect(response).to be_a(String)
    end

    it "can't return results higher than param size passed or lower than 1" do
      results = []
      max_size = 6
      100.times do
        get '/api/roll', size: max_size
        results << JSON.parse(last_response.body)["result"].roman_to_int
      end
      expect(results.max).to be <= max_size
      expect(results.min).to be >= 1
    end

    it 'returns a pseudo random result and converts it into roman' do
      srand(rand)
      rand_value = rand(1..6)
      srand(rand)
      get '/api/roll'
      expect(JSON.parse(last_response.body)).to eq({ 'result' => rand_value.to_roman })
    end
  end
end
