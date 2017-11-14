class Admin::PhotosController < AdminController

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.save
    redirect_to admin_products_path
  end

  def destroy
    Photo.destroy(params[:id])
    flash[:notice] = "Photo removed!"
  end

  private

  def photo_params
    params.require(:photo).permit(:filelocation, :product_id)
  end

end
