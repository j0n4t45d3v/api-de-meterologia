# frozen_string_literal: true

require './app/service/forecast/current_weather_by_city'
require './app/service/forecast/current_weather_by_zipcode'

class CurrentWeatherController
  def self.find_by_city(city, metric)
    Forecast::CurrentWeatherByCity.new(city: city, metric: metric).call
  end

  def self.find_by_zipcode(zipcode, metric)
    Forecast::CurrentWeatherByZipcode.new(zipcode: zipcode, metric: metric).call
  end
end
