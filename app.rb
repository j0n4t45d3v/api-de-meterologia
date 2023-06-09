# frozen_string_literal: true

require 'sinatra'
require 'sinatra/activerecord'
require './app/controller/user_controller'
require './app/service/jwt/generate_token'
require './app/controller/current_weather_controller'
require 'dotenv'
Dotenv.load

set :database, { adapter: ENV.fetch('DB_ADAPTER', nil), database: ENV.fetch('DB_URI', nil) }
set :bind, '0.0.0.0'

host = ARGV[0] || 'localhost' # Padrão: localhost
set :host, host

before do
  content_type :json
end

get '/' do
  { name: 'Api de meterologia', version: '0.0.1' }.to_json
end

post '/users/register' do
  req = JSON.parse(request.body.read)
  { new_user: UserController.create(req) }.to_json
end

post '/token' do
  req = JSON.parse(request.body.read)
  { token: GenarateToken.new.call(req['email']) }.to_json
end

get '/users/:email' do
  { user: UserController.find(params[:email]) }.to_json
end

get '/forecast/:city' do
  { forecast: CurrentWeatherController.find_by_city(params[:city], 'metric') }.to_json
end
