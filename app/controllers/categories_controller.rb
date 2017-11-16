class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @products = if params[:search]
        @category.products.where("name ILIKE :query OR brand ILIKE :query OR description ILIKE :query", query: "%#{params[:search][:term]}%" )
      else
        @category.products.all
      end
  end

  private

    def search_params
      params.require(:search).permit(:term)
    end

end
