class SongsController < ApplicationController

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params)
    # redirect_to song_path(@song)
  end

  def update
  end

  def delete
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist, :echonest, :album)
  end
end
