class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  # :trackable, :validatable, :recoverable
  devise :database_authenticatable, :registerable,
         :rememberable, :omniauthable, :omniauth_providers => [:facebook]

  has_many :orders
  has_many :products, through: :orders

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
     # user.name = auth.info.name   # assuming the user model has a name
     # user.image = auth.info.image # assuming the user model has an image
     # If you are using confirmable and the provider(s) you use validate emails,
     # uncomment the line below to skip the confirmation emails.
     # user.skip_confirmation!
    end
  end

  def cart_count
    all_items = $redis.hvals "cart#{id}"
    all_items.sum.to_i
  end

  def cart_total_price
    get_cart_products_with_qty.map { |product, qty| product.price * qty.to_i }.reduce(:+)
  end

  def get_cart_products_with_qty
    cart_ids = []
    cart_qtys = []
    ($redis.hgetall current_user_cart).map do |key, value|
      cart_ids << key
      cart_qtys << value
    end
    cart_products = Product.find(cart_ids)
    cart_products.zip(cart_qtys)
  end

  def current_user_cart
    "cart#{id}"
  end

  def purchase_cart_products!
    get_cart_products_with_qty.each do |product, qty|
      self.orders.create(user: self, product: product, quantity: qty)
    end
    $redis.del current_user_cart
  end

  def add_product_to_cart(product_id)
    $redis.hset current_user_cart, product_id, 1
  end

  def remove_product_from_cart(product_id)
    $redis.hdel current_user_cart, product_id
  end

  def change_quantity(product_id, quantity)
    $redis.hset "cart#{id}", product_id, quantity
  end

end
