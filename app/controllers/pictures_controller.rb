class PicturesController < ApplicationController
  def index
  end

  def new
    @picture = Picture.new
  end

  def create
    Picture.create(picture_params)
    flash[:notice] = '投稿しました'
    #redirect_to pictures_path
  end

  private

  def picture_params
    params.require(:picture).permit(:content)
  end

end
