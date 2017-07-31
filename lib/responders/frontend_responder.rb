class FrontendResponder < ActionController::Responder

  def initialize(*)
    super
    @options[:location] = redirect_path if custom_redirect_path?
  end

  private

    def redirect_path
      @controller.params[:redirect_path]
    end

    def custom_redirect_path?
      @controller.params.include? :redirect_path
    end

end
