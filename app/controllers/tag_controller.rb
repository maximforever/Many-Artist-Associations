class TagController < ApplicationController
  def index
    @tags = Tag.all
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to root_path
    else
      render root_path
    end  
  end

  def show
    @tag = Tag.find(params[:id])
    @songs = @tag.songs
  end



  private

  def tag_params
    params.require(:tag).permit(:name)
  end

end
