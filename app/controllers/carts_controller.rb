class CartsController < ApplicationController

  before_action :authenticate_user!

  def show
    # cart_ids = []
    # cart_qtys = []
    # ($redis.hgetall current_user_cart).map do |key, value|
    #   cart_ids << key
    #   cart_qtys << value
    # end
    # cart_products = Product.find(cart_ids)
    # @cart_products_with_qty = cart_products.zip(cart_qtys)
    #
    # @cart_total = @cart_products_with_qty.map { |product, qty| product.price * qty.to_i }.reduce(:+)

    # Refactored into User model
    @cart_products_with_qty = current_user.get_cart_products_with_qty
    @cart_total = current_user.cart_total_price

  end

  def add
    $redis.hset current_user_cart, params[:product_id], 1
    render json: current_user.cart_count, status: 200
  end

  def remove
    $redis.hdel current_user_cart, params[:product_id]

    respond_to do |format|
      format.js { render json: current_user.cart_count, status: 200 }
      format.html { redirect_to cart_path }
    end
  end

  def change
    # byebug
    $redis.hset current_user_cart, params[:product_id], params[:quantity][:qty]
    redirect_to cart_path
  end

  private

    def current_user_cart
      "cart#{current_user.id}"
    end

end
