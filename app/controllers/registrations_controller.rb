class RegistrationsController < Devise::RegistrationsController
  attr_accessor :order, :subscription, :user, :sign_up_error

  def new
    if @invitation = find_invitation
      @email = @invitation.email
    end
    super
  end

  def create
    @sign_up_error = []
    super do |user|
      @user = user
      if user.errors.messages.blank?
        @order = Order.where("email = ?", user.email).last
        @subscription = Subscription.where("email = ?", user.email).last

        if !@order.blank?
          verify_order_otp
        elsif !@subscription.blank?
          verify_subscription_otp
        else
          user.delete
          flash[:warning] = "Please buy subscription plan or purchase book"
          redirect_to new_subscription_path and return          
        end

        if !@sign_up_error.empty?
          flash[:warning] = "Invalid email otp combination"
          redirect_to new_user_registration_path and return
        end

        if user.persisted? && (invitation = find_invitation)
          AcceptGroupInvitation.new(invitation).call
        end
      end
    end
  end

  def update_password
    @crnt_user = User.find(current_user.id)
    if @crnt_user.valid_password? params[:user][:current_password]
      if [params[:user][:current_password], params[:user][:password], params[:user][:password_confirmation]].uniq.length == 1
        flash[:notice] = "Current passwor must be different than Password and Confirm Password."
        redirect_to edit_user_registration_path      
      else
        if @crnt_user.update(user_params)
          flash[:notice] = "Password has been changed successfully." 
          redirect_to edit_user_registration_path
        else
          flash[:alert] = @crnt_user.errors.full_messages.to_s.gsub('"','').gsub("[","").gsub("]","")
          redirect_to edit_user_registration_path
        end
      end
    else
      flash[:alert] = "Current passsword does not match."
      redirect_to edit_user_registration_path
    end    
  end

  protected

  def update_resource(resource, params)
    resource.update(params)
  end

  private

    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end

    def after_sign_up_path_for(*)
      root_path
    end

    def after_update_path_for(*)
      edit_user_registration_path
    end

    def sign_up_params
      params.require(:user).permit :name, :email, :password, :password_confirmation, :redemption_code, :location, :terms_of_service
    end

    def account_update_params
      params.require(:user).permit :name, :email, :password, :password_confirmation, :image, :website, :bio, :location
    end

    def find_invitation
      params[:invitation_code] and GroupInvitation.find_by(code: params[:invitation_code])
    end

    def verify_order_otp
      if @order.try('order_otp') != params[:user][:order_otp].to_i
        if !@subscription.blank?
          verify_subscription_otp
        else
          user.delete
          @sign_up_error.push("Invalid email otp combination")
        end
      else
        user.update_attributes(is_permanent: true, phone_no: Address.find_by(id: @order.shipping_address_id).mobile)
        @order.update_attributes(user_id: user.id, complete: true, email: user.email)
      end
    end

    def verify_subscription_otp
      if @subscription.subscription_otp != params[:user][:order_otp].to_i
        @user.delete
        @sign_up_error.push("Invalid email otp combination")
      else
        @user.update_attributes(is_permanent: false, phone_no: @subscription.sub_mobile_no)
        @subscription.update_attributes(user_id: @user.id)
      end
    end

end
