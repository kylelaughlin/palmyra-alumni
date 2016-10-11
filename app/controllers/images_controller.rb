class ImagesController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  def create
    @image = Image.new(image_params)
    @image.save

    respond_to do |format|
      format.json { render :json => { url: @image.picture.url} }
    end
  end

  private

  def image_params
    params.require(:image).permit(:picture)
  end

end
