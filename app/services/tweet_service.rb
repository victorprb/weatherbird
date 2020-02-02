module Twitter
  class TweetService
    def initialize(weather_service)
      @message = "%s\n%s" % [weather_service.weather_message, weather_service.forecast_message]
    end

    def tweet
        client.update(@message)
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
  end
end
