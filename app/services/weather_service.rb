require 'openweathermap'
require 'json'

module Weather
  class WeatherService
    def initialize(city_id)
      @city_id = city_id
    end

    def weather_message
      @data = client

      @message = "%.0f°C e %s em %s em %s." % [
        @data.weather[:temperature],
        @data.weather[:description],
        @data.weather[:city],
        Time.now.strftime('%d/%m'),
      ]
    end
    
    def forecast_message
      @data = client
      @forecast_message = []

      @data.forecast[:weather].each do |key, value|
        @forecast_message << "%.0f°C em %s" % [value, key]
      end

      @message = "Média para os próximos dias:\n" + @forecast_message.join("\n")
    end

    private

    def client
      @config = {
        city_id: @city_id,
        api_key: ENV['OWM_API_KEY'],
      }
      OpenWeatherMap::API.new(@config)
    end
  end
end
