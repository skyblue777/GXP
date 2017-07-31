class GeoLocation

  attr_accessor :user, :request, :env

  def initialize(user, request)
    @user = user
    @request = request
    @env = request.env
  end

  def location
    env['HTTP_X_REAL_IP'] = '24.21.129.15' if Rails.env.development?
    user.try(:location) || request.location
  end

end