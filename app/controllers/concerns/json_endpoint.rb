module JSONEndpoint
  extend ActiveSupport::Concern

  included do
    respond_to :json
    self.responder = Metova::Responder
  end

end
