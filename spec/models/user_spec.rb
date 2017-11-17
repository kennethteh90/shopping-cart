require 'rails_helper'

RSpec.describe User, type: :model do

  it { is_expected.to have_many(:orders) }
  it { is_expected.to have_many(:products).through(:orders) }


  let!(:user) { create(:user) }
  let!(:product) { create(:product) }

  before do
    user.add_product_to_cart(product.id)
  end

  describe 'cart_count' do

    it { expect(user.cart_count).to eq(1) }

  end

  describe 'get_cart_products_with_qty' do

    it { expect(user.get_cart_products_with_qty).to eq([[product, "1"]]) }

  end

  describe 'cart_total_price' do

    it { expect(user.cart_total_price).to eq(product.price) }

  end

  describe 'add_product_to_cart' do

    it { expect(user.cart_count).to eq(1) }

  end

  describe 'remove_product_from_cart' do

    before { user.remove_product_from_cart(product.id) }

    it { expect(user.cart_count).to eq(0) }

  end

  describe 'change_quantity' do

    before { user.change_quantity(product.id, 5) }

    it { expect(user.cart_count).to eq(5) }

  end

  describe 'purchase_cart_products!' do

    before { user.purchase_cart_products! }

    it { expect(user.orders.count).to eq(1) }
    it { expect(user.cart_count).to eq(0) }

  end



end
