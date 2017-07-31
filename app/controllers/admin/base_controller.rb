require Rails.root.join('lib', 'responders', 'admin_responder')

class Admin::BaseController < ApplicationController
  before_action :authenticate_admin!

  layout 'admin'
  respond_to :html
  self.responder = AdminResponder

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :unauthorized_request!


  def show
    edit
    render :edit
  end

  def current_user
    current_admin
  end

  private

    def unauthorized_request!(exception)
      flash[:alert] = 'You are not authorized to perform this action.'
      redirect_to request.referrer || admin_root_path
    end

end
