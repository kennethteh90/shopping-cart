class CartsController < ApplicationController

  before_action :authenticate_user!

  def show
    cart_ids = $redis.smembers current_user_cart
    @cart_products = Product.find(cart_ids)

    # @cart_total = @cart_products.map { |product| product.price }.reduce(:+)
    @cart_total = @cart_products.reduce(0) { |memo, product| memo + product.price}
  end

  def add
    $redis.sadd current_user_cart, params[:product_id]
    render json: current_user.cart_count, status: 200
  end

  def remove
    $redis.srem current_user_cart, params[:product_id]
    render json: current_user.cart_count, status: 200
  end

  private

    def current_user_cart
      "cart#{current_user.id}"
    end

end
