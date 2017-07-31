class Admin::AdminsController < Admin::BaseController
  def index
    @admins = policy_scope(Admin)
  end

  def new
    @admin = Admin.new
    authorize @admin
  end

  def create
    @admin = Admin.create permitted_params_with_password
    authorize @admin
    respond_with @admin, location: admin_root_path
  end

  def edit
    @admin = Admin.find params[:id]
    authorize @admin
  end

  def update
    @admin = Admin.find params[:id]
    authorize @admin
    update_resource @admin, params
    respond_with @admin, location: admin_root_path
  end

  def destroy
    @admin = Admin.find params[:id]
    authorize @admin
    @admin.destroy
    redirect_to admin_root_path
  end

  private


    def permitted_params_with_password
      params.require(:admin).permit :name, :email, :password, :password_confirmation, :current_password
    end

    def permitted_params
      permitted_params_with_password.permit :name, :email
    end

    def update_resource(resource, params)
      if permitted_params_with_password[:current_password].present?
        resource.update_with_password(permitted_params_with_password)
      else
        resource.update_without_password(permitted_params)
      end
    end

end
