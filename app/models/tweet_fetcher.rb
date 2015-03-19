class TweetFetcher

  def initialize(user)
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_APP_ID']
      config.consumer_secret     = ENV['TWITTER_APP_SECRET']
      config.access_token        = user.token
      config.access_token_secret = user.secret
    end
  end

  def make_tweet(text)
    @client.update(text)
  end

  def list_tweet(url)
    @client.search(url)
  end
end
