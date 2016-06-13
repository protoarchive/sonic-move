module EchonestHelper
  require 'redis'
  include HTTParty

  # Echonest is now owned by Spotify. This helper assists with connecting with
  # Spotify api.

  @@auth_uri = 'https://accounts.spotify.com/api/token'
  @@api_uri = 'https://api.spotify.com/v1'
  @@api_callback = 'http://localhost:3000/spotify/callback'
  @@spotify_store = Redis.new     # Redis connection, defaults to localhost:6379

  def self.authorize
    # Using Client Credentials Flow:
    # https://developer.spotify.com/web-api/authorization-guide/#client-credentials-flow
    # No refresh tokens are provided. Set access_token to expire at the same rate
    # as the Spotify service. A new token is requested when Redis removese the
    # expired token.
    @options = {
      query: {
          client_id: SPOTIFY_CLIENT_ID,
          client_secret: SPOTIFY_CLIENT_SECRET,
          response_type: "code",
          grant_type: "client_credentials",
          redirect_uri: @@api_callback
        }
      }
      response = HTTParty.post(@@auth_uri, @options)
      self.save_token(response)
      response.parsed_response
    end

  def self.valid_token?
    @@spotify_store.exists('access_token') ? self.access_token() : self.authorize()
  end

  def self.access_token
    # Return data object for Echonest.song(q)
    {'access_token' => @@spotify_store.get('access_token')}
  end

  def self.save_token(res)
    @@spotify_store.set('access_token', res.parsed_response['access_token'])
    @@spotify_store.expire('access_token', res.parsed_response['expires_in'])
  end

end
