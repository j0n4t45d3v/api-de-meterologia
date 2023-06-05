# frozen_string_literal: true

require 'sinatra'
require 'sinatra/activerecord'
require './app/controller/user_controller'
require './app/controller/current_weather_controller'
require 'dotenv'
Dotenv.load

set :database, { adapter: ENV['DB_ADAPTER'], database: ENV['DB_URI'] }

before do
  content_type :json
end

post '/users/register' do
  req = JSON.parse(request.body.read)
  { new_user: UserController.create(req) }.to_json
end

get '/users/:email' do
  { user: UserController.find(params[:email]) }.to_json
end

get '/forecast/city/:city' do
  { forecast: CurrentWeatherController.find_by_city(params[:city], 'metric') }.to_json
end

# get '/forecast/zipcode/:zipcode' do
#   { forecast: CurrentWeatherController.find_by_zipcode(params[:zipcode], 'metric') }.to_json
# end
