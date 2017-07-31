class S3Presigner
  attr_accessor :object

  def initialize(params = {})
    @filename = SecureRandom.hex + params[:name]
  end

  memoize def signed_url
    bucket.objects[@filename].url_for(:put, signature_version: :v4).to_s
  end

  memoize def bucket
    s3 = AWS::S3.new
    s3.buckets[ENV['AWS_S3_BUCKET_NAME']]
  end

end
