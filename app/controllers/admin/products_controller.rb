class Admin::ProductsController < Admin::BaseController
  include ApplicationHelper
  def index
    @products = Product.all
    respond_with @products
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create permitted_params
    if !@product.id.nil?
      @product.product_prices.create!(price: params[:txt_col_book_hardcover], book_type: BookType.first.name) #if !params[:txt_col_book_hardcover].blank?
      @product.product_prices.create!(price: params[:txt_col_paperback], book_type: BookType.second.name) #if !params[:txt_col_paperback].blank?    
      @product.product_prices.create!(price: params[:txt_book_audio], book_type: BookType.third.name) #if !params[:txt_book_audio].blank?        
      @product.product_prices.create!(price: params[:txt_book_ebook], book_type: BookType.fourth.name) #if !params[:txt_book_ebook].blank?        
      respond_with @product
    else
      respond_with @product
    end
  end

  def edit
    @product = find_product
  end

  def update
    @product = find_product
    @product.update permitted_params
    books_prices_for_cart(1, @product).update_attributes(price: params[:txt_col_book_hardcover])
    books_prices_for_cart(2, @product).update_attributes(price: params[:txt_col_paperback])
    books_prices_for_cart(5, @product).update_attributes(price: params[:txt_book_audio]) 
    books_prices_for_cart(6, @product).update_attributes(price: params[:txt_book_ebook]) 
    respond_with @product
  end

  def destroy
    @product = find_product
    # @product.product_prices.destroy_all
    # OrderProduct.destroy_all(product_id: @product.id)
    @product.destroy
    respond_with @product
  end

  private

    def permitted_params
      params.require(:product).permit :name, :price, :description, :image, :book_download, :book_types_id
    end

    def find_product
      Product.find params[:id]
    end

end
