require 'rack'
require './response'

app = Rack::Builder.new do
  map '/' do
    run Response::Normal
  end

  map '/timeout' do
    run Response::Timeout
  end

  map '/failure' do
    run Response::Failure
  end
end

run app
