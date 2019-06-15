class PicturesController < ApplicationController
  before_action :set_picture, only: [:edit, :update, :destroy]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def index
    @pictures = Picture.all.order(created_at: :desc)
#    binding.pry
    # @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def new
    if params[:back]
      @picture = Picture.new(picture_params)
    else
      @picture = Picture.new
    end
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    if @picture.save
      flash[:notice] = '投稿しました'
      ContactMailer.contact_mail(@picture).deliver  ##追記
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
      @picture = current_user.pictures.build(picture_params)
      render :new if @picture.invalid?
    else
      set_picture
      @picture.content = picture_params[:content]
      @picture.image = picture_params[:image]
      @picture.image_cache = picture_params[:image_cache]
      render :edit if @picture.invalid?
    end
  end

  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  private

  def picture_params
    params.require(:picture).permit(:content, :image, :image_cache)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def ensure_correct_user
    if current_user.id != @picture.user_id
      flash[:notice] = '操作権限がありません'
      redirect_to pictures_path
    end
  end

end
