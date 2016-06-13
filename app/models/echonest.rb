class Echonest
  require 'net/http'
  require 'redis'
  include HTTParty
  include EchonestHelper
  # The Echonest was acquied by Spotify, hence the name -- but they are now the
  # same thing.
  #
  # This model is for accessing the Spotify Web API. All calls to the api should
  # live here.
  #
  # Helper methods for tasks that may require calling independent of the model,
  # such as authorization, live in echonest_helpers
  @@base_uri = 'https://api.spotify.com/v1'

  def self.song(q)
    # Handles requests to Spotify for song search.
    # ex.: self.get('/song/search', query: { title: query })
    response = EchonestHelper.valid_token?()
    HTTParty.get(
        @@base_uri + '/search',
        headers: {"Authorization" => "Bearer #{response["access_token"]}"},
        query: {"type" => "track", "q" => q}
    )
  end

  def self.artist(query)
  end
end
