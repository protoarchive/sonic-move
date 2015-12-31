class Playlist < ActiveRecord::Base
  belongs_to :user
  has_many :playlist_songs, dependent: :destroy
  has_many :songs, through: :playlist_songs
  alias_attribute :playlist_songs, :songs
end
