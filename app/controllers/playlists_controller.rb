class PlaylistsController < ApplicationController
  def new
    @playlist = Playlist.new
  end

  def create
    @user = current_user
    @playlist = @user.playlists.create(playlist_params)

    redirect_to playlist_path(@playlist)
  end

  def index
  end

  def show
    @playlist = Playlist.find(params[:id])
  end

  def edit
  end

  def destroy
    @playlist = Playlist.find(params[:id])
    @playlist.destroy
    redirect_to user_path(current_user)
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name)
  end
end
