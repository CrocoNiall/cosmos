CarrierWave.configure do |config|
  config.fog_use_ssl_for_aws = false
      config.fog_credentials = {
        :provider  => 'AWS',  # required
        :aws_access_key_id  => ENV['aws_access_key_id'],  # required
        :aws_secret_access_key  => ENV['aws_secret_access_key'],  # required
        :region => 'eu-west-1',  # optional, defaults to 'us-east-1'
      }
      config.fog_directory  = 'cosmos.storage'  # required
      config.fog_public  = true  # optional, defaults to true
    end