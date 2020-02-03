require 'weather_service'
require 'tweet_service'

class CityWeathersController < ApplicationController
  include Twitter
  include Weather

  def weather
    weather_service = Weather::WeatherService.new(weather_params)
    tweet_service = Twitter::TweetService.new(weather_service)

    begin
      tweet_service.tweet
      @response = {status: 201, message: 'Tweet message created'}
    rescue => e
      @response = { status: 500, message: e }
    end

    render json: @response, status: @response[:status]
  end

  private

  def weather_params
    params.require(:city_id)
  end
end
