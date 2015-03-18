class TweetFetcher
  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_APP_ID']
      config.consumer_secret     = ENV['TWITTER_APP_SECRET']
      config.access_token        = User.last.token
      config.access_token_secret = User.last.secret
    end
  end

  def make_tweet(text)
    @client.update(text)
  end
end