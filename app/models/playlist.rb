class Playlist < ActiveRecord::Base
  has_many :songs, through: :playlist_songs
  belongs_to :user
end
