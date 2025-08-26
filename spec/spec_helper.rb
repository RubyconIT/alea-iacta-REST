require 'rack/test'
require 'rspec'
require_relative '../api/base'
require_relative '../tools/string'

RSpec.configure do |config|
  config.include Rack::Test::Methods
end
