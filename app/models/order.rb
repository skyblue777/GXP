class Order < ActiveRecord::Base
  extend Enumerize

  TAX_RATE = 0.07

  has_paper_trail

  belongs_to :billing_address, class_name: 'Address'
  belongs_to :shipping_address, class_name: 'Address'
  belongs_to :users
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products
  has_many :redemption_codes
  has_many :payments
  has_many :refunds

  enumerize :shipped, in: [:new, :shipped], default: :new

  # before_validation :update_subtotal, :update_shipping, :update_tax, :update_total

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :update

  # def calculate_subtotal
  #   order_products.map { |op| op.product.valid? ? (op.quantity * op.product.price) : 0 }.sum || 0
  # end

  def calculate_shipping
    shipping_count = order_products.select{|op|!op.digital}.count
    if shipping_count > 0 && shipping_address
      shipping_rate(shipping_address.country)
    else
      0
    end
  end
  def calculate_tax
    subtotal * TAX_RATE
  end

  def total
    calculate_shipping = calculate_shipping.nil? ? 0 : calculate_shipping
    subtotal = subtotal.nil? ? 0 : subtotal
    tax = tax.nil? ? 0 : tax
    subtotal + tax + calculate_shipping
  end

  def product_count
    order_products.inject(0) { |sum, op| sum += op.quantity }
  end

  # Added token to access orders for non logged in users
  # or users without accounts since that is how the checkout process
  # was designed by Metova and a request was made to make downloads available
  # to users without accounts
  def redirect_path(sale)
    self.complete = true
    self.product_count.times do |i|
      self.redemption_codes << (RedemptionCode.create order: self)
    end
    random_token = SecureRandom.urlsafe_base64(nil, false)
    self.token = random_token
    self.save!
    "/orders/#{sale.guid}/complete"
  end


  private

    def shipping_rate(country_code)
      country = ISO3166::Country.new(country_code)
      case country.region
      when "Americas"
        if country.alpha2 == "US"
          6
        elsif country.alpha2 == "CA"
          15
        end
      when "Asia"
        25
      when "Africa"
        25
      when "Europe"
        15
      when "Oceana"
        25
      else
        25
      end
    end

    # def update_subtotal
    #   self.subtotal = calculate_subtotal
    # end

    def update_shipping
      self.shipping = calculate_shipping
    end

    def update_total
      self.price = total
    end

    def update_tax
      self.tax = calculate_tax
    end
end
