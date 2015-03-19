class ImagesController < ApplicationController
  def index
  end

  def create
    @image = Image.create(image_params)
    redirect_to new_image_path
  end
  # know id of the user and then attach the image to the user. we do not need to create a new user.

  def new
    @image = Image.new
    @images = Image.all
  end

  # Use strong_parameters for attribute whitelisting
  # Be sure to update your create() and update() controller methods.
private

  def image_params
    params.require(:image).permit(:image)
  end

end
