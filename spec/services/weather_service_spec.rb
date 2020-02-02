require 'rails_helper'
require 'weather_service'

RSpec.describe Weather::WeatherService, type: :service do
  ws = Weather::WeatherService.new('3454690')

  it 'returns weather message' do
    expect(ws.weather_message).to match(/°C e .* em .*/)
  end

  it 'returns forecast message' do
    expect(ws.forecast_message).to match(/Média para os próximos dias:\n.*°C em .*/)
  end
end
