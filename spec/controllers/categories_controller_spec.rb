require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  describe 'GET #show' do
      let(:category) { create(:category) }
      before { get :show, params: { id: category } }
      it { expect(assigns(:category)).to eq(category) }

      context 'when there is NIL search term' do
      end

      context 'when there IS a search term' do
      end

  end

end
