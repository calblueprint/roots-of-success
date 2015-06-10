unless Rails.env.test?
  require "refile/s3"

  aws_config = {
    access_key_id: ENV["AWS_ACCESS_KEY_ID"],
    secret_access_key: ENV["AWS_SECRET_KEY"],
    region: "us-west-1",
    bucket: "roots-#{Rails.env}"
  }

  Refile.cache = Refile::S3.new(max_size: 500.kilobytes, prefix: "cache", **aws_config)
  Refile.store = Refile::S3.new(prefix: "store", **aws_config)

  Refile.host = "//da1avfhquctvk.cloudfront.net"
end
