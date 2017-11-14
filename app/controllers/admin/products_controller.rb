class Admin::ProductsController < AdminController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @category = Category.new
  end

  def create
    @product = Product.new(product_params)
    @cat_array = params.dig(:product, :category_ids).reject(&:empty?)
    @cat_array.each do |cat|
      @category = Category.find(cat)
      @product.categories << @category
    end

    if @product.save
      @product.photos.create(filelocation: params[:product][:photos])
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
    @cat_array = params.dig(:product, :category_ids).reject(&:empty?)
    @product.product_categories.destroy_all
    @cat_array.each do |cat|
      @category = Category.find(cat)
      @product.categories << @category
    end

    if @product.update(product_params)
      flash[:notice] = "Product updated!"
      redirect_to product_path
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
