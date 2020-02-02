require 'weather_service'
require 'tweet_service'

class CityWeathersController < ApplicationController
  include Twitter
  include Weather

  def weather
    weather_service = Weather::WeatherService.new(weather_params)
    tweet_service = Twitter::TweetService.new(weather_service)

    tweet_service.tweet
    render json: {status: 201, message: 'Tweet created'}, status: :created
  end

  private

  def weather_params
    params.require(:city_id)
  end
end
