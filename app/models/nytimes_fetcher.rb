class NytimesFetcher

  def initialize
    @nytimes_connection = Faraday.new(:url => 'http://api.nytimes.com') do |faraday|
    faraday.request  :url_encoded             # form-encode POST params
    faraday.response :logger                  # log requests to STDOUT
    faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  def news(section)
    response = @nytimes_connection.get do |req|
      req.url "/svc/search/v2/articlesearch.json?fq=section_name:(#{section})"
      req.params['api-key'] = ENV["NYTIMES_KEY"]

      req.headers['Content-Type'] = 'application/json'
    end
    JSON.parse(response.body)
  end

  def article(_id)
    response = @nytimes_connection.get do |req|
      req.url "/svc/search/v2/articlesearch.json?fq=_id:(#{_id})"
      req.params['api-key'] = ENV["NYTIMES_KEY"]

      req.headers['Content-Type'] = 'application/json'
    end
    JSON.parse(response.body)

  end


end
