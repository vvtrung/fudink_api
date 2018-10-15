CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'xxx',
    aws_secret_access_key: 'yyy',
    region: 'eu-west-1',
    host: 's3.example.com',
    endpoint: 'https://s3.example.com:8080'
  }
  config.fog_directory = 'name_of_directory'
  config.fog_public = false
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
end
