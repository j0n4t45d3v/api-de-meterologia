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
      get = fetch
      response = JSON.parse(get)

      {
        temp: response['main'], # retorna em %
        description: response['weather'][0]['description'],
        country: response['sys']['country'],
        cloud: "#{response['clouds']['all']}%",
        wind: response['wind']
      }
    end

    private
    def fetch
      url = 'https://api.openweathermap.org/data/2.5/weather'
      request = RestClient.get("#{url}?q=#{@city}&lang=pt_br&units=#{@metric}&appid=#{ENV.fetch(
        'KEY_API', nil
      )}")

      request.body
    end
  end
end
