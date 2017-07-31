class SessionsController < Devise::SessionsController

  private

    def after_sign_in_path_for(resource)
      stored_location_for(resource) || projects_path
      # stored_location_for(resource) || root_path
    end

end

