class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @cart_action = @product.cart_action current_user.try :id
  end

end
