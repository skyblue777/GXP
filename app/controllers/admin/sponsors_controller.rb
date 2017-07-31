class Admin::SponsorsController < Admin::BaseController

  def index
    @sponsors = Sponsor.all
    respond_with @sponsors
  end

  def show
    @sponsor = find_sponsor
  end

  def new
    @sponsor = Sponsor.new
  end

  def create
    @sponsor = Sponsor.create permitted_params
    respond_with @sponsor
  end

  def edit
    @sponsor = find_sponsor
  end

  def update
    @sponsor = find_sponsor
    @sponsor.update permitted_params
    respond_with @sponsor
  end

  def destroy
    @sponsor = find_sponsor
    @sponsor.destroy
    respond_with @sponsor
  end

  private

    def permitted_params
      params.require(:sponsor).permit :name, :email, :phone, :address_1, :address_2, :city, :state, :country, :zip, :duration, :start_date, :region, :notes, :admin_notes
    end

    def find_sponsor
      Sponsor.find params[:id]
    end

end
