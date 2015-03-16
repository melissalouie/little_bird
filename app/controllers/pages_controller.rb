class PagesController < ApplicationController
  def index
    if params[:text]
      tf = TweetFetcher.new
      tf.make_tweet(params[:text])
    end
  end
end
