require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  describe 'GET #show' do
      let(:category) { create(:category) }
      let(:product) { create(:product, name: 'Blah') }
      let!(:product_category) { create(:product_category, product: product, category: category) }

      context 'for category show only' do
        before { get :show, params: { id: category } }
        it { expect(assigns(:category)).to eq(category) }
      end

      context 'list products under the category when there is no search term' do
        before { get :show, params: { id: category, product_id: product } }
        it { expect(assigns(:products).count).to eq(1) }
      end

      context 'list products under the category when there IS a search term' do
        before { get :show, params: { id: category, search: { term: "lah" } } }
        it { expect(assigns(:products).count).to eq(1) }
      end

  end

end
