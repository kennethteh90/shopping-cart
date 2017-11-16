require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  describe "GET #index" do
    let(:admin) { create(:admin) }
    let!(:categories) { create_list }
  end

  describe "" do
  end

end
