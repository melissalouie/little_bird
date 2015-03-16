class ArticlesController < ApplicationController
  def show
    params[:text]
    tf = TweetFetcher.new
    tf.make_tweet(params[:text])
  end

  def index
  end
end
