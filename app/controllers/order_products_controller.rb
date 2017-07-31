class OrderProductsController < ApplicationController
  before_action :get_order
  include ApplicationHelper
  # before_action :check_for_existing_item, only: [:create]
  require 'securerandom'
  respond_to :json
  def create
    # validate that the product exists

    @order = current_order
    # @order = Order.last
    tot_prc = 0
    @order.permalink ||= SecureRandom.hex(5).to_s
    @order.name ||= "order-#{SecureRandom.hex(5)}"
    @order.email = "abc@gmail.com"
    @order.save!
    session[:order_id] = @order.id
    session[:permalink] = @order.permalink
    item_list = []
        
    @product = Product.find(params[:order_product][:product_id])
    if !params[:order_product][:colored_version][:quantity_hcol].blank? && params[:order_product][:colored_version][:quantity_hcol].to_i > 0
      qnt = params[:order_product][:colored_version][:quantity_hcol].to_i
      order_quantities(@product, qnt, 1, "Hardcover")
      book_cart_prize = books_prices_for_cart(1, @product).price || 0
      if book_cart_prize != 0.0
        item_list << "#{qnt} #{@product.name} Hardcover"
      end
    end

    if !params[:order_product][:colored_version][:quantity_pcol].blank? && params[:order_product][:colored_version][:quantity_pcol].to_i > 0
      qnt = params[:order_product][:colored_version][:quantity_pcol].to_i
      order_quantities(@product, qnt, 2, "Paperback")
      book_cart_prize = books_prices_for_cart(2, @product).price || 0
      if book_cart_prize != 0.0
        item_list << " #{qnt} #{@product.name} Paperback"
      end 
    end

    if !params[:order_product][:aud_ebk][:quantity_aud].blank? && params[:order_product][:aud_ebk][:quantity_aud].to_i > 0
      qnt = params[:order_product][:aud_ebk][:quantity_aud].to_i
      order_quantities(@product, qnt, 5, "Audio")    
      book_cart_prize = books_prices_for_cart(5, @product).price || 0
      if book_cart_prize != 0.0
        item_list << " #{qnt} #{@product.name} Audio"
      end
    end

    if !params[:order_product][:aud_ebk][:quantity_ebk].blank? && params[:order_product][:aud_ebk][:quantity_ebk].to_i > 0
      qnt = params[:order_product][:aud_ebk][:quantity_ebk].to_i
      order_quantities(@product, qnt, 6, "Ebook")
      book_cart_prize = books_prices_for_cart(6, @product).price || 0
      if book_cart_prize != 0.0
        item_list << " #{qnt} #{@product.name} Ebook"
      end 
    end

    # @order = current_order
    # # @order = Order.last
    # @order.permalink ||= SecureRandom.hex(5).to_s
    # @order.name ||= "order-#{SecureRandom.hex(5)}"
    # @order.email = "abc@gmail.com"
    # @order.save!
    # session[:order_id] = @order.id
    # session[:permalink] = @order.permalink

    # redirect_to cart_path
    @order_products = current_order.order_products
    @order_products.each do |cod|
      tot_prc = tot_prc + cod.price
    end
    @shipping_count = @order_products.where(digital: false).count
    render json: { item_count: @shipping_count, item_list: item_list, books_tot_price: tot_prc}
    # redirect_to products_path
  end

  def update
    @order_product = @order.order_products.find(params[:id])
    if order_product_params[:quantity] == '0'
      @order_product.destroy
    else
      total_price = unit_price(@order_product.product_price_id) * order_product_params[:quantity].to_i
      @order_product.update_attributes(:quantity => order_product_params[:quantity], :price => total_price)
    end
    # call save to trigger order pricing updates
    @order.save
    redirect_to cart_path
  end

  def destroy
    @order.order_products.find(params[:id]).destroy
    @order.save
    redirect_to cart_path
  end

  private

  def order_product_params
    params.require(:order_product).permit(:quantity)
  end

  def get_order
    @order = current_order
  end

  def order_quantities(product, qnt, val, book_type)
    book_cart_prize = books_prices_for_cart(val, @product).price || 0
    product_params = {
      name: product.name, 
      price: book_cart_prize * qnt, 
      description: product.description, 
      digital: product.book_download.present? ? true : false,
      quantity: qnt,
      product_price_id: books_prices_for_cart(val, @product).id
    }
    clean_params = order_product_params.merge!(product_params)
    @order = current_order
    # Order.last
    if (book_cart_prize * qnt) != 0
      extng_order = @order.order_products.where("product_price_id = ?  AND name = ?", existing_order(params[:order_product][:product_id], book_type), params[:book_name]).first
      if !extng_order.blank?
        tot_qnt = extng_order.quantity + qnt
        tot_price = unit_price(extng_order.product_price_id) * tot_qnt
        extng_order.update_attributes(:quantity => tot_qnt, :price => tot_price)
      else
        @order.order_products.create(clean_params)
      end
    end
  end

  def check_for_existing_item
    existing_item = current_order.order_products.where("product_id = ?", params[:order_product][:product_id])
    if existing_item[0]
      existing_item[0].quantity += params[:order_product][:quantity].to_i
      existing_item[0].save
      redirect_to cart_path
    end
  end
end
