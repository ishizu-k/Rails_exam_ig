class FavoritesController < ApplicationController
  def index
    @favorite = current_user.favorites
  end

  def create
    favorite = current_user.favorites.create(picture_id: params[:picture_id])
    flash[:notice] = "#{favorite.picture.user.name}さんの投稿をお気に入り登録しました"
    redirect_to pictures_url
  end


  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    flash[:notice] = "#{favorite.picture.user.name}さんの投稿をお気に入り解除しました"
    redirect_to pictures_url
  end

end
