require 'grape'
require_relative '../tools/string'

module API
  class Base < Grape::API
    format :json
    prefix :api

    resource :ping do
      get do
        { answer: 'pong' }
      end
    end

    resource :roll do
      get do
        dice_size = params[:size] ? params[:size]&.to_i : 6
        { result: rand(1..dice_size)&.to_roman }
      end
    end
  end
end
