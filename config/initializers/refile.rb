#require 'refile/s3'
#require 'refile/simple_form'

#aws = {
#  access_key_id: ENV['AWS_ACCESS_KEY_ID'],
#  secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
#  bucket: ENV['AWS_S3_BUCKET_NAME'],
#  region: 'us-east-1'
#}

#if Rails.env.test?
#  Refile.cache = Refile::Backend::FileSystem.new('/tmp/cache', max_size: 5.gigabytes)
#  Refile.cache = Refile::Backend::FileSystem.new('/tmp/store', max_size: 5.gigabytes)
#else
#  Refile.cache = Refile::S3.new(prefix: 'attachments/cache', max_size: 5.gigabytes, **aws)
#  Refile.store = Refile::S3.new(prefix: 'attachments/store', max_size: 5.gigabytes, **aws)
#end
