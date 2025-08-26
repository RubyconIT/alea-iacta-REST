require 'grape'
require_relative '../tools/integer'

module API
  class Base < Grape::API
    format :json
    prefix :api

    resource :ping do
      get do
        { ping: 'pong' }
      end
    end

    resource :dice do
      get do
        { result: rand(1..params[:size] || 6).to_roman }
      end
    end
  end
end