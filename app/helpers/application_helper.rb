module ApplicationHelper
  def active_route(path)
    "active" if current_page?(path)
  end

  def within_layout(layout)
    view_flow.set :layout, capture { yield }
    render template: "layouts/#{layout}"
  end

  def error_messages_for(record, *attributes)
    record.errors.to_hash(true).slice(*attributes).values.flatten
  end

  def admin_orders_total(order)
    sum  = 0.0  

    order.order_products.each do |ord|
      sum  = sum + (ProductPrice.find_by(id: ord.product_price_id).price * ord.quantity)
      # (op_product(ord.product_price_id).blank? ? 0.0 : (op_product(ord.product_price_id).price.blank? ? 0.0 : op_product(ord.product_price_id).price))
    end
    return sum
  end

  def existing_user(user_email)
    return !User.find_by(email: user_email).blank?
  end

  def sub_purchase(mob_no)
    Subscription.find_by_sub_mobile_no_and_renewal_status(mob_no, true)
  end

  def existing_sub_mob(mobile_no)
    return !Subscription.find_by(sub_mobile_no: mobile_no).blank?
  end

  def existing_sub_user(user_email)
    return !Subscription.find_by(email: user_email).blank?
  end

  def video_url(attachment)
    "#{ENV['AWS_S3_BASE_URL']}/#{attachment.id}"
  end

  def edit_country_code(country_code)
    if country_code.nil?
      ""
    else
      country_mob_code = ISO3166::Country[country_code].country_code
      "+"+country_mob_code
    end
  end


  def refile_app_path
    main_app.refile_app_path
  end

  def if_persisted_path(record, path)
    if record && record.persisted?
      send path, record
    else
      '#'
    end
  end

  def existing_order(product_id, book_type)
    ProductPrice.find_by("product_id = ? AND book_type = ?", product_id, book_type).id
  end

  def shipping_charges(country_code, order_products)
    order_products.each do |op|
      @book_type = ProductPrice.find_by(id: op.product_price_id)
      if !@book_type.nil? && ["Hardcover","Paperback"].include?(@book_type.book_type)
        @book_type = true
      end
    end
    if @book_type == true
      if ["North America", "Europe"].include?(ISO3166::Country[country_code].continent)
        return 15
      elsif ["Asia", "Australia", "Africa"].include?(ISO3166::Country[country_code].continent)
        return 25
      elsif ISO3166::Country[country_code].continent ||= "South America" 
        return 6
      end
    else
      return 0
    end
  end

  def voting_status(phone_no)
    voted = "" 
    not_voted = ""
    Project.all.each do |cp| 
      if cp.contest.ends_at.to_date > Time.zone.now.to_date
        vote_status = User.find_by(phone_no: phone_no).voted_for?(cp) unless User.find_by(phone_no: phone_no).blank?
        if vote_status == true
          voted = true
        else
          not_voted = true
        end
      end
    end
    return voted, not_voted
  end


  def unit_price(order_product)
    return ProductPrice.find_by(id: order_product).price
  end

  def book_type(order_product)
    return ProductPrice.find_by(id: order_product).book_type
  end

  def books_prices(id, product)
    if id == 1
      return  product.product_prices.where("book_type = ?", "Hardcover").blank? ? 0  : product.product_prices.where("book_type = ?", "Hardcover").first.price
    elsif id == 2
      return product.product_prices.where("book_type = ?", "Paperback").blank? ? 0 : product.product_prices.where("book_type = ?", "Paperback").first.price
    elsif id == 5
      return product.product_prices.where("book_type = ?", "Audio").blank? ? 0 : product.product_prices.where("book_type = ?", "Audio").first.price
    elsif id == 6
      return product.product_prices.where("book_type = ?", "Ebook").blank? ? 0 : product.product_prices.where("book_type = ?", "Ebook").first.price
    end
  end

  def books_prices_for_cart(id, product)
    if id == 1
      return  product.product_prices.where("book_type = ?", "Hardcover").blank? ? 0  : product.product_prices.where("book_type = ?", "Hardcover").first
    elsif id == 2
      return product.product_prices.where("book_type = ?", "Paperback").blank? ? 0 : product.product_prices.where("book_type = ?", "Paperback").first
    elsif id == 5
      return product.product_prices.where("book_type = ?", "Audio").blank? ? 0 : product.product_prices.where("book_type = ?", "Audio").first
    elsif id == 6
      return product.product_prices.where("book_type = ?", "Ebook").blank? ? 0 : product.product_prices.where("book_type = ?", "Ebook").first
    end
  end  


  def op_product(product_prices_id)
    return ProductPrice.find_by(id: product_prices_id).product
  end

end
