# add a #current_page method to params controller
class ActionController::Parameters
  def current_page(path)
    controller, action = path.split('#')
    self[:controller] == controller && self[:action] == action
  end
end