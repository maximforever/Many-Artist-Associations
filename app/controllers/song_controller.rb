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

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to root_path
    else
      render 'song/new'
    end
  end

  private
    def song_params
      params.require(:song).permit(:name, :artist)
    end

end
