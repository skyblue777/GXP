require 'authorizenet' 
require 'securerandom'
include AuthorizeNet::API

class Square

  API_LOGIN_ID = "584wWHh2"
  API_TRANSACTION_KEY = "9p7J8f2JAqBY7x32"
  MD5_VALUE = "Akash1993"
  def initialize(params = {})
    @nonce = params[:params]
    @order = params[:order]
  end
  def charge
    transaction = Transaction.new(API_LOGIN_ID, API_TRANSACTION_KEY, :gateway => :sandbox)
    
    request = CreateTransactionRequest.new
  
    request.transactionRequest = TransactionRequestType.new()
    request.transactionRequest.amount = @nonce[:amount].to_f.round(2)
    request.transactionRequest.payment = PaymentType.new
    request.transactionRequest.payment.creditCard = CreditCardType.new(@nonce[:card_no].delete(' '), @nonce[:card_expiration_date], @nonce[:card_cvv])
    request.transactionRequest.customer = CustomerType.new(nil,@nonce[:email])
    request.transactionRequest.transactionType = TransactionTypeEnum::AuthCaptureTransaction
    response = transaction.create_transaction(request)
    if response != nil
      if response.messages.resultCode == MessageTypeEnum::Ok
        if response.transactionResponse != nil && response.transactionResponse.messages != nil
          puts "Successful charge (auth + capture) (authorization code: #{response.transactionResponse.authCode})"
          puts "Transaction Response code : #{response.transactionResponse.responseCode}"
          puts "Code : #{response.transactionResponse.messages.messages[0].code}"
          puts "Description : #{response.transactionResponse.messages.messages[0].description}"
          Payment.create(
            tender_id: response.transactionResponse.authCode,
            transaction_id: response.transactionResponse.transId,
            location_id: response.transactionResponse.transHash,
            amount: @nonce[:amount].to_f.round(2),
            card_brand: response.transactionResponse.accountType,
            card_last_4: response.transactionResponse.accountNumber.last(4),
            order: @order,
            user: @user
          )          
        else
          puts "Transaction Failed"
          if response.transactionResponse.errors != nil
            puts "Error Code : #{response.transactionResponse.errors.errors[0].errorCode}"
            puts "Error Message : #{response.transactionResponse.errors.errors[0].errorText}"
          end
        end
      else
        puts "Transaction Failed"
        if response.transactionResponse != nil && response.transactionResponse.errors != nil
          puts "Error Code : #{response.transactionResponse.errors.errors[0].errorCode}"
          puts "Error Message : #{response.transactionResponse.errors.errors[0].errorText}"
        else
          puts "Error Code : #{response.messages.messages[0].code}"
          puts "Error Message : #{response.messages.messages[0].text}"
        end
      end
    else
      puts "Response is null"
    end
    return response
  end


  def charge_recurring
    transaction = Transaction.new(API_LOGIN_ID, API_TRANSACTION_KEY, :gateway => :sandbox)
    request = CreateTransactionRequest.new
    request.transactionRequest = TransactionRequestType.new()
    request.transactionRequest.amount = @nonce[:amount].to_f.round(2)
    request.transactionRequest.payment = PaymentType.new
    request.transactionRequest.payment.creditCard = CreditCardType.new(@nonce[:card_no].delete(' '), @nonce[:card_expiration_date], @nonce[:card_cvv])
    request.transactionRequest.customer = CustomerType.new(nil,@nonce[:email])
    request.transactionRequest.transactionType = TransactionTypeEnum::AuthCaptureTransaction
    response = transaction.create_transaction(request)
    if response != nil
      if response.messages.resultCode == MessageTypeEnum::Ok
        if response.transactionResponse != nil && response.transactionResponse.messages != nil
          puts "Successful charge (auth + capture) (authorization code: #{response.transactionResponse.authCode})"
          puts "Transaction Response code : #{response.transactionResponse.responseCode}"
          puts "Code : #{response.transactionResponse.messages.messages[0].code}"
          puts "Description : #{response.transactionResponse.messages.messages[0].description}"
          Payment.create(
            tender_id: response.transactionResponse.authCode,
            transaction_id: response.transactionResponse.transId,
            location_id: response.transactionResponse.transHash,
            amount: @nonce[:amount].to_f.round,
            card_brand: response.transactionResponse.accountType,
            card_last_4: response.transactionResponse.accountNumber.last(4),
            card_exp_month: @nonce[:card_expiration_date].first(2).to_i,
            card_exp_year: (Time.now.year.to_s.first(2)+@nonce[:card_expiration_date].last(2)).to_i)
        else
          puts "Transaction Failed"
          if response.transactionResponse.errors != nil
            puts "Error Code : #{response.transactionResponse.errors.errors[0].errorCode}"
            puts "Error Message : #{response.transactionResponse.errors.errors[0].errorText}"
          end
        end
      else
        puts "Transaction Failed"
        if response.transactionResponse != nil && response.transactionResponse.errors != nil
          puts "Error Code : #{response.transactionResponse.errors.errors[0].errorCode}"
          puts "Error Message : #{response.transactionResponse.errors.errors[0].errorText}"
        else
          puts "Error Code : #{response.messages.messages[0].code}"
          puts "Error Message : #{response.messages.messages[0].text}"
        end
      end
    else
      puts "Response is null"
    end
    return response
  end


  def renew_charge_recurring
    transaction = Transaction.new(API_LOGIN_ID, API_TRANSACTION_KEY, :gateway => :sandbox)
    request = CreateTransactionRequest.new
    request.transactionRequest = TransactionRequestType.new()
    request.transactionRequest.amount = @nonce.subscription_plan.amount/100.to_f.round(2)
    request.transactionRequest.payment = PaymentType.new
    request.transactionRequest.payment.creditCard = CreditCardType.new(@nonce[:card_id].delete(' '), @nonce[:card_exp_month].to_s+@nonce[:card_exp_year].to_s.last(2), @nonce[:card_cvv])
    request.transactionRequest.customer = CustomerType.new(nil,@nonce[:email])
    request.transactionRequest.transactionType = TransactionTypeEnum::AuthCaptureTransaction
    response = transaction.create_transaction(request)
    if response != nil
      if response.messages.resultCode == MessageTypeEnum::Ok
        if response.transactionResponse != nil && response.transactionResponse.messages != nil
          puts "Successful charge (auth + capture) (authorization code: #{response.transactionResponse.authCode})"
          puts "Transaction Response code : #{response.transactionResponse.responseCode}"
          puts "Code : #{response.transactionResponse.messages.messages[0].code}"
          puts "Description : #{response.transactionResponse.messages.messages[0].description}"
          Payment.create(
            tender_id: response.transactionResponse.authCode,
            transaction_id: response.transactionResponse.transId,
            location_id: response.transactionResponse.transHash,
            amount: @nonce.subscription_plan.amount/100.to_f.round(2),
            card_brand: response.transactionResponse.accountType,
            card_last_4: response.transactionResponse.accountNumber.last(4),
            card_exp_month: @nonce[:card_exp_month],
            card_exp_year: @nonce[:card_exp_year])
        else
          puts "Transaction Failed"
          if response.transactionResponse.errors != nil
            puts "Error Code : #{response.transactionResponse.errors.errors[0].errorCode}"
            puts "Error Message : #{response.transactionResponse.errors.errors[0].errorText}"
          end
        end
      else
        puts "Transaction Failed"
        if response.transactionResponse != nil && response.transactionResponse.errors != nil
          puts "Error Code : #{response.transactionResponse.errors.errors[0].errorCode}"
          puts "Error Message : #{response.transactionResponse.errors.errors[0].errorText}"
        else
          puts "Error Code : #{response.messages.messages[0].code}"
          puts "Error Message : #{response.messages.messages[0].text}"
        end
      end
    else
      puts "Response is null"
    end
    return response
  end









  def create_customer_profile(params)
    transaction = Transaction.new(API_LOGIN_ID, API_TRANSACTION_KEY, :gateway => :sandbox)
    request = CreateCustomerProfileRequest.new
    payment = PaymentType.new(CreditCardType.new(params[:card_no].delete(' '), Time.now.year.to_s.first(2)+params[:card_expiration_date].last(2)+"-"+params[:card_expiration_date].first(2)))
    profile = CustomerPaymentProfileType.new(nil,nil,payment,nil,nil)
    request.profile = CustomerProfileType.new(params[:email]+rand(10000).to_s, params[:email], params[:email], [profile], nil)
    response = transaction.create_customer_profile(request)
    if response.messages.resultCode == MessageTypeEnum::Ok
      puts "Successfully created aX customer profile with id:  #{response.customerProfileId}"
      puts "Customer Payment Profile Id List:"
      response.customerPaymentProfileIdList.numericString.each do |id|
        puts id
      end
      puts "Customer Shipping Address Id List:"
      response.customerShippingAddressIdList.numericString.each do |id|
        puts id
      end
    else
      puts response.messages.messages[0].text
      # return "Failed to create a new customer profile."
    end
    return response
  end

end
