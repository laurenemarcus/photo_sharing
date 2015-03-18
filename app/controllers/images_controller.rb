class ImagesController < ActiveRecord::Base

def create
  @image = Image.create(image_params)
end
# know id of the user and then attach the image to the user. we do not need to create a new user.

private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

def user_params
  params.require(:user).permit(:images)
end

end
