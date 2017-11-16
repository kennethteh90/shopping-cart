require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe 'GET #show' do

    let!(:product) { create(:product) }

    before { get :show, params: { id: product } }

    it { expect(assigns(:product)).to eq(product) }

    # need to test @cart_action

  end

  describe 'GET #index' do

    context 'when there is no search term' do

      let!(:product) { create_list(:product, 3) }

      before { get :index }

      it { expect(assigns(:products).count).to eq(3) }

    end

    context 'when there is a search term' do

      let!(:product) { create_list(:product, 3, name: 'Blah') }

      before { get :index, params: { search: { term: 'lah' } } }

      it { expect(assigns(:products).count).to eq(3) }

    end

  end

end
