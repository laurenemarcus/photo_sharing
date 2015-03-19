class ImagesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
  end

  def create
    @user = User.find(params[:user_id])
    @image = @user.images.new(image_params)
    if @image.save
      flash[:notice] = "Your photo was added!"
      redirect_to user_images_path
    else
      flash[:alert] = "There was a problem uploading your photo.  Please try again."
      redirect_to :back
    end
  end

  def new
    @user = User.find(params[:user_id])
    @image = @user.images.new
  end

private

  def image_params
    params.require(:image).permit(:image)
  end

end
