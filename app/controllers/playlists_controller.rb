class PlaylistsController < ApplicationController
  def new
    @playlist = Playlist.new
  end

  def create
    @user = current_user
    @playlist = @user.playlists.create(playlist_params)
  end

  def index
  end

  def show
  end

  def edit
  end

  def destroy
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name)
  end
end
