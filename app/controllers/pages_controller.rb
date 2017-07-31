class PagesController < ApplicationController
  authenticated! only: :send_request
  include ActionView::Helpers::SanitizeHelper
  # include ActiveMerchant::Shipping
  require 'bitpay_sdk'
  def home
    # pem = BitPay::KeyUtils.generate_pem
    # sin = BitPay::KeyUtils.generate_sin_from_pem(File.read("#{Rails.public_path}/bitpay_pem"))  
    # client = bitpayitPay::SDK::Client.new(api_uri:'https://test.bitpay.com', insecure: true)
    # debugger
    # debugger
    # paring = client.pair_client()
    # debugger
      # paring1 = client.pair_pos_client(paring[0]["pairingCode"])  
    # debugger
    # invoice = client.create_invoice( price: 12, currency: "USD", facade: "merchant")
    # debugger
    # payment = client.create_invoice(price: 12.00 , currency: "USD", token: paring[0]["token"])

    # (api_uri: 'https://test.bitpay.com', pem: File.read("#{Rails.public_path}/bitpay_pem"), insecure: true)
    # debugger
    # redirect_to "https://test.bitpay.com/api-access-request?pairingCode=#{paring[0]["pairingCode"]}"
  end

  def buy
  end

  def about
  end

  def tos
  end

  def send_request
    @request = ""
  end

  def request_dashboard
    @requests_info = current_user.send_requests
  end

  def send_request_post
    mobile_nos = []
    send_errors = []
    mobile_nos << params[:code1] + params[:mobile1] if params[:code1].present? && params[:mobile1].present?
    mobile_nos << params[:code2] + params[:mobile2] if params[:code2].present? && params[:mobile2].present?
    mobile_nos << params[:code3] + params[:mobile3] if params[:code3].present? && params[:mobile3].present?
    mobile_nos << params[:code4] + params[:mobile4] if params[:code4].present? && params[:mobile4].present?
    mobile_nos << params[:code5] + params[:mobile5] if params[:code5].present? && params[:mobile5].present?
    mobile_nos << params[:code6] + params[:mobile6] if params[:code6].present? && params[:mobile6].present?
    mobile_nos << params[:code7] + params[:mobile7] if params[:code7].present? && params[:mobile7].present?
    mobile_nos << params[:code8] + params[:mobile8] if params[:code8].present? && params[:mobile8].present?
    mobile_nos.each do |mob_no|
      begin
        client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
        response = client.messages.create(
        from: ENV['TWILIO_NUMBER'],
        to:   mob_no,
        body: "#{strip_tags(params[:content].html_safe)}")
        SendRequest.create(message: strip_tags(params[:content].html_safe), phone_no: mob_no, user_id: current_user.id)
      rescue Twilio::REST::RequestError => e
        send_errors << "Please enter valid phone number"
      end
    end
    if !send_errors.blank?
      flash[:alert] = send_errors
    else
      flash[:notice] = "Request sent successfully"
    end
    redirect_to send_request_path    
  end  

  protected

    def use_nav_layout?
      true
    end

end
