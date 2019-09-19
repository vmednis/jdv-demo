require "dynamoid"

Dynamoid.configure do |config|
  config.namespace = "api"
  config.access_key = ENV["DDB_ACCESS_KEY_ID"]
  config.secret_key = ENV["DDB_SECRET_ACCESS_KEY"]
  config.region     = ENV["DDB_REGION"]
  config.endpoint   = ENV["DDB_ENDPOINT"] unless ENV["DDB_ENDPOINT"].nil?
end

Dynamoid.included_models.each { |m| m.create_table(sync: true) }
