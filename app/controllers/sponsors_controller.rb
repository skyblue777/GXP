class SponsorsController < ApplicationController
  def new
    @sponsor = Sponsor.new
  end

  def create
    @sponsor = Sponsor.create permitted_params
    if @sponsor.errors.messages.blank?
      flash[:success] = 'Thank you for submitting a sponsorship application!'
    end
    respond_with @sponsor, location: root_path
  end

  private
  def permitted_params
    params.require(:sponsor).permit :name, :email, :phone, :address_1, :address_2, :city, :state, :country, :zip, :duration, :start_date, :region, :notes
  end
end
