class ImageManipulationsController < ApplicationController
  def create
    result = ImageManipulationService.manipulate(image_manipulation_params[:image].path, image_manipulation_params[:manipulations])

    send_file result
  end

  private

  def image_manipulation_params
    params.permit(:image, manipulations: {})
  end
end
