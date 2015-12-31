class PlaylistSong < ActiveRecord::Base
  belongs_to :playlists
  belongs_to :songs
end
