class S3Controller < ApplicationController

  def signed_url
    presigner = S3Presigner.new params
    render text: presigner.signed_url
  end

end
