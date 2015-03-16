class FeedzillaFetcher

  def initialize
    @feedzilla_connection = Faraday.new(:url => 'http://api.feedzilla.com') do |faraday|
    faraday.request  :url_encoded             # form-encode POST params
    faraday.response :logger                  # log requests to STDOUT
    faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  def news(category_id)
    response = @feedzilla_connection.get do |req|
      req.url "/v1/categories/#{category_id}/articles.json"
      req.headers['Content-Type'] = 'application/json'
    end
    JSON.parse(response.body)
  end

end
