# frozen_string_literal: true

require 'rest-client'
require 'dotenv'
Dotenv.load

module Forecast
  class CurrentWeatherByZipcode
    def initialize(zipcode:, metric:)
      @zipcode = zipcode
      @metric = metric
    end

    def call
      url = "https://api.openweathermap.org/data/2.5/weather?zip=#{@zipcode},br&lang=pt_br&units=#{@metric}&appid=#{ENV.fetch(
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
