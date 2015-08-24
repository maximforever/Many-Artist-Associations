class TaggingController < ApplicationController

  def main
    @songs = Song.all
  end

  def new
    @tagging = Tagging.new
    @songs = Song.all
    @tags = Tag.all
  end

  def create
    @tagging = Tagging.new(tagging_params)
    if @tagging.save
      redirect_to tag_path(@tagging.tag_id)
    else
      render root_path
    end
  end


  private

  def tagging_params
    params.require(:tagging).permit(:song_id, :tag_id)
  end

end
