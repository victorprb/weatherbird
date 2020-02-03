module Twitter
  class TweetService
    def initialize(weather_service)
      @weather_service = weather_service
    end

    def tweet
      client.update(tweet_message)
    end

    private
    def client
      Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
        config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
        config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
        config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
      end
    end

    def tweet_message
      @current_weather = @weather_service.weather_message
      @forecast_weather = @weather_service.forecast_message

      unless @current_weather[:status] == :success || @forecast_weather[:status] == :success
        raise 'Internal server error'
      else
        "#{@current_weather[:message]}\n#{@forecast_weather[:message]}"
      end
    end
  end
end
