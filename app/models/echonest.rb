require 'net/http'

class Echonest
  include HTTParty

  @@base_uri = 'http://developer.echonest.com/api/v4'
  @@api_key = ECHONEST_KEY
  # base_uri 'http://developer.echonest.com/api/v4'
  # default_params api_key: ECHONEST_KEY

  def self.song(query)
    # self.get('/song/search', query: { title: query })
    HTTParty.get(@@base_uri + '/song/search?api_key=' + @@api_key + '&title=' + query)
  end

  def self.artist(query)
  end
end