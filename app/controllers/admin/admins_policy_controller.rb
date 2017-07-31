class Admin::AdminsPolicyController < Admin::BaseController
  def index
    @adminpolicies = AdminMobEmail.all
  end

  def new
    @adminpolicy = AdminMobEmail.new
  end

  def create
    if AdminMobEmail.where("code = ? AND admin_mobile_no = ?", params[:admin_mob_email][:code], params[:admin_mob_email][:admin_mobile_no]).count >= 1
      flash[:alert] = "Do not allow to enater duplicate mobile no."
      redirect_to admin_admins_policy_index_path
    elsif AdminMobEmail.count >= 4
      flash[:alert] = "Do not allow more than four admin policy."
      redirect_to admin_admins_policy_index_path
    else
      @adminpolicy = AdminMobEmail.create permitted_params
      respond_with @adminpolicy, location: admin_admins_policy_index_path
    end     
  end

  def edit
    @adminpolicy = AdminMobEmail.find params[:id]
  end

  def update
    if AdminMobEmail.where("code = ? AND admin_mobile_no = ?", params[:admin_mob_email][:code], params[:admin_mob_email][:admin_mobile_no]).count >= 1
      flash[:alert] = "Do not allow to enater duplicate mobile no."
      redirect_to admin_admins_policy_index_path
    else
      @adminpolicy = AdminMobEmail.find params[:id]
      @adminpolicy.update_attributes(permitted_params)
      respond_with @adminpolicy, location: admin_admins_policy_index_path
    end
  end

  def destroy
    @adminpolicy = AdminMobEmail.find params[:id]
    @adminpolicy.destroy
    redirect_to admin_admins_policy_index_path
  end

  private

    def permitted_params
      params.require(:admin_mob_email).permit :admin_email, :admin_mobile_no, :code
    end

end
