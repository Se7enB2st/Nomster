class PhotosController < ApplicationController
  before_action :authenticate_user!
  def create
    @photo = Photo.find(params[:place_id])
    @photo.caption.create(caption_params.merge(user: current_user))
    redirect_to place_path(@place)
  end

  private

  def caption_params
    params.require(:photo).permit(:picture, :caption)
  end
end
