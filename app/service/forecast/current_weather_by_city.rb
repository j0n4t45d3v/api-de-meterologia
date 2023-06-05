# frozen_string_literal: true

require 'rest-client'
require 'dotenv'
Dotenv.load

module Forecast
  class CurrentWeatherByCity
    def initialize(city:, metric:)
      @city = city
      @metric = metric
    end

    def call
      url = "https://api.openweathermap.org/data/2.5/weather?q=#{@city}&lang=pt_br&units=#{@metric}&appid=#{ENV.fetch(
        'KEY_API', nil
      )}"
      request = RestClient.get(url)
      response = JSON.parse(request.body)

      {
        temp: response['main'], # retorna em %
        description: response['weather'][0]['description'],
        country: response['sys']['country'],
        cloud: response['clouds']['all'], # retorna em %
        wind: response['wind']
      } # temperatura, vento, humidade
    end
  end
end
