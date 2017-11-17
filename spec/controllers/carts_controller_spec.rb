require 'rails_helper'

RSpec.describe CartsController, type: :controller do

  describe 'GET #show' do

    let!(:product) { create(:product) }
    let!(:user) { create(:user) }

    before do
      sign_in user
      put :add, params: { product_id: product.id }
      get :show
    end

    it { expect(assigns(:cart_products_with_qty)).to eq(user.get_cart_products_with_qty) }
    it { expect(assigns(:cart_total)).to eq(user.cart_total_price) }

  end

  describe 'PUT #add' do

    let!(:product) { create(:product) }
    let!(:user) { create(:user) }

    before do
      sign_in user
      put :add, params: { product_id: product.id }
    end

    it { expect(user.cart_count).to eq(1) }
    it { expect($redis.hgetall "cart#{user.id}").to eq("#{product.id}"=>"1") }
    it { expect(response).to be_success }
  end


  describe 'PUT #remove' do

    let!(:product) { create(:product) }
    let!(:user) { create(:user) }

    context 'JS request: when user comes from product page' do

      before do
        sign_in user
        put :add, params: { product_id: product.id }
        put :remove, params: { product_id: product.id }, format: "js"
      end

      it { expect(user.cart_count).to eq(0) }
      it { expect(response).to be_success }

    end

    context 'HTML request: when user comes from cart page' do

      before do
        sign_in user
        put :add, params: { product_id: product.id }
        put :remove, params: { product_id: product.id }
      end

      it { expect(user.cart_count).to eq(0) }
      it { expect(:subject).to redirect_to(cart_path) }

    end

  end

  describe 'PUT #change' do

    let!(:product) { create(:product) }
    let!(:user) { create(:user) }

    before do
      sign_in user
      put :add, params: { product_id: product.id }
      put :change, params: { product_id: product.id, quantity: { qty: 5 } }
    end

    it { expect(user.cart_count).to eq(5) }
    it { expect(:subject).to redirect_to(cart_path) }

  end

end
