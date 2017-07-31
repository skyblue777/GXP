class AdminResponder < ActionController::Responder
  include Responders::HttpCacheResponder
  include Responders::FlashResponder
  include Responders::CollectionResponder

  def initialize(*)
    super
    @resources.prepend :admin
  end

end
