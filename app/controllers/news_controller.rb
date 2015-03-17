class NewsController < ApplicationController

  def index
    nytimes_fetcher = NytimesFetcher.new
     @feed = nytimes_fetcher.news(params[:section] ||= "World")["response"]["docs"]
    # (params[:category_id])["articles"]
  end

  def show
    nytimes_fetcher = NytimesFetcher.new
    @article = nytimes_fetcher.article(params[:_id] ||= "550862c938f0d819240d10c1")["response"]["docs"][0]
  end

end
