require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIAX4FI7CLFKBYVACPX',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1'
    }

    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'okr-intern-s3'
    config.fog_public = false
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/okr-intern-s3'
  end
end
