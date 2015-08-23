class SongController < ApplicationController
  def index
    @songs = Song.order(:artist)
  end

  def show
    @song = Song.find(params[:id])
    @tags = @song.tags
  end

  def find_by_artist
    @songs = Song.where(artist: params[:artist])
    @song_artist = params[:artist]
  end

  def create
    @new_song = Song.new(song_params)
    if @new_song.save
      redirect_to root_path
    else
      render create_song_path
    end

  end


  private

  def song_params
      params.permit(:name, :artist)
  end
end
