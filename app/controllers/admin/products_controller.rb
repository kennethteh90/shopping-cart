class Admin::ProductsController < AdminController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product added!"
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Product updated!"
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def destroy
    Product.destroy(params[:id])
    flash[:notice] = "Product removed!"
    redirect_to admin_products_path
  end

  private

    def product_params
      params.require(:product).permit(:name, :brand, :description, :price, :quantity, :size, :color)
    end

end
