class ProductsController < ApplicationController
  def index
    @products = Product.all
    @order_product = current_order.order_products.new
  end

  def download_url
    @product = Product.find(params[:id])
    prefix = Refile.backends['store'].instance_values['prefix']
    key = prefix + '/' + @product.book_download_id
    s3 = AWS::S3.new.buckets[ENV['AWS_S3_BUCKET_NAME']]
    url_options = { 
      expires_in:                   60.minutes, 
      use_ssl:                      true, 
      signature_version:            :v4,
      response_content_disposition: "attachment; filename=\"#{@product.book_download_filename}\""

    }
    url = s3.objects[key].url_for(:read,url_options).to_s
    redirect_to url
  end

end
