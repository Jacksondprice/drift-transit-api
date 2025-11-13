require 'sinatra'
require 'json'
require_relative 'lib/store'

get '/api/schedules' do
  content_type :json
  Store.all.to_json
end

post '/api/schedules' do
  body = JSON.parse(request.body.read)
  halt 400 unless body['name']
  Store.add(body).to_json
end
