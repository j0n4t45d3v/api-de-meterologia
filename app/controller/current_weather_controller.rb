# frozen_string_literal: true

require './app/service/forecast/current_weather_by_city'

class CurrentWeatherController
  def self.find_by_city(city, metric)
    Forecast::CurrentWeatherByCity.new(city: city, metric: metric).call
  end
end
