require 'openai'

OpenAI.configure do |config|
  config.access_token = ENV.fetch("OPENAI_API_KEY")
  config.log_errors = true # Optional, but recommended for development
end
