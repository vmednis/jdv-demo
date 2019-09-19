Jets.application.configure do
  config.project_name = "jdv-demo"
  config.mode = "api"

  config.prewarm.enable = true # default is true
  # config.prewarm.rate = '30 minutes' # default is '30 minutes'
  # config.prewarm.concurrency = 2 # default is 2
  # config.prewarm.public_ratio = 3 # default is 3

  config.function.memory_size = 512

  config.controllers.default_protect_from_forgery = false
end
