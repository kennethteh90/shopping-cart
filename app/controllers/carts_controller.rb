class CartsController < ApplicationController

  before_action :authenticate_user!

  def show
    # Refactored into User model
    @cart_products_with_qty = current_user.get_cart_products_with_qty
    @cart_total = current_user.cart_total_price

  end

  def add
    current_user.add_product_to_cart(params[:product_id])
    render json: current_user.cart_count, status: 200
  end

  def remove
    current_user.remove_product_from_cart(params[:product_id])
    respond_to do |format|
      format.js { render json: current_user.cart_count, status: 200 }
      format.html { redirect_to cart_path }
    end
  end

  def change
    current_user.change_quantity(params[:product_id], params[:quantity][:qty])
    redirect_to cart_path
  end

end
