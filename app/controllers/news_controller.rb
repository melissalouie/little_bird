class NewsController < ApplicationController
  before_action :authenticate

  def index
    nytimes_fetcher = NytimesFetcher.new
     @feed = nytimes_fetcher.news(params[:section] ||= "World")["response"]["docs"]
    # (params[:category_id])["articles"]
  end

  def show
    nytimes_fetcher = NytimesFetcher.new
    @article = nytimes_fetcher.article(params[:_id])["response"]["docs"][0]
    @comments = nytimes_fetcher.nytimes_comments(params[:web_url])["results"]["comments"]
    @tweet_bucket = TweetFetcher.new(current_user).list_tweet("#{params[:web_url]} #littlebirdapp")
  end

end
