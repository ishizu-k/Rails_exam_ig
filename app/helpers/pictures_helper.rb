module PicturesHelper
  def choose_new_or_edit
    if action_name == 'new'
      confirm_pictures_path
    elsif action_name == 'edit'
      confirm_picture_path(@picture.id)
    end
  end

  def back_confirm
    if params[:id].nil?
      new_picture_path
    else
      edit_picture_path
    end
  end
end
