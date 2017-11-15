class ProductsController < ApplicationController

  def index
    @products = if params[:search]
        Product.where("name ILIKE :query OR brand ILIKE :query OR description ILIKE :query", query: "%#{params[:search][:term]}%" )
      else
        Product.all
      end
  end

  def show
    @product = Product.find(params[:id])
    @cart_action = @product.cart_action current_user.try :id
  end

  private

    def search_params
      params.require(:search).permit(:term)
    end

end
