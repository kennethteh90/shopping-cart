require 'rails_helper'

RSpec.describe Admin::CategoriesController, type: :controller do

  describe "GET #index" do
    let!(:category) { create_list(:category, 3) }
    before { get :index }
    it { expects(assigns(:category).count).to eq(3) }
  end

  describe "POST #create" do
    let(:admin) { create(:admin) }
    before do
      sign_in admin
    end

    context 'when admin#save passes' do
      #it will flash[:notice] = "Category added!"
      it { expect(response).to redirect_to new_admin_product_path }
    end

    context 'when admin#save fails' do
      #it will flash[:notice] = "Category can't be blank!"
      it { expect(response).to render_template(render 'admin/products/new') }
    end
  end

  describe "GET #edit" do
  end

  describe "PUT/PATCH #update" do
  end

  describe 'DELETE #destroy' do
  end

end
