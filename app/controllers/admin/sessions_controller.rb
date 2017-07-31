class Admin::SessionsController < Devise::SessionsController

  private

  def after_sign_in_path_for(*)
    admin_root_path
  end
end