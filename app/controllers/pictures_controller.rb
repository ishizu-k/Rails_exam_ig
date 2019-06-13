class PicturesController < ApplicationController
  def index
    @pictures = Picture.all.order(created_at: :desc)
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      flash[:notice] = '投稿しました'
      redirect_to pictures_path
    else
      render 'new'
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:content, :image, :image_cache)
  end

end
