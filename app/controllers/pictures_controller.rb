class PicturesController < ApplicationController
  before_action :set_picture, only: [:edit, :update, :destroy]

  def index
    @pictures = Picture.all.order(created_at: :desc)
  end

  def new
    if params[:back]
      @picture = Picture.new(picture_params)
    else
      @picture = Picture.new
    end
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

  def edit
    if params[:back]
      @picture.content = picture_params[:content]
      @picture.image_cache = picture_params[:image_cache]
    end
  end

  def update
    if @picture.update(picture_params)
      flash[:notice] = '編集しました'
      redirect_to pictures_path
    else
      render 'edit'
    end
  end

  def destroy
    @picture.destroy
    flash[:notice] = '削除しました'
    redirect_to pictures_path
  end

  def confirm
    if params[:id].nil?
      @picture = Picture.new(picture_params)
      render :new if @picture.invalid?
    else
      set_picture
      @picture.content = picture_params[:content]
      @picture.image = picture_params[:image]
      @picture.image_cache = picture_params[:image_cache]
      render :edit if @picture.invalid?
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:content, :image, :image_cache)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end

end
