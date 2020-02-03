require 'openweathermap'
require 'json'

module Weather
  class WeatherService
    def initialize(city_id)
      @city_id = city_id
    end

    def weather_message
      @data = client.weather
      if @data[:status].to_i == 200
        {
          status: @data[:status],
          message: "%.0f°C e %s em %s em %s." % [
            @data[:temperature],
            @data[:description],
            @data[:city],
            Time.now.strftime('%d/%m'),
          ]
        }
      else
        {
          status: @data[:status],
          message: @data[:message]
        }
      end
    end

    def forecast_message
      @data = client.forecast
      if @data[:status].to_i == 200
        @forecast_message = []

        @data[:weather].each do |key, value|
          @forecast_message << "%.0f°C em %s" % [value, key]
        end

        {
          status: @data[:status],
          message: "Média para os próximos dias:\n" + @forecast_message.join("\n")
        }
      else
        {
          status: @data[:status],
          message: @data[:message]
        }
      end
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
