# Load the rails application
require File.expand_path('../application', __FILE__)

require 'redis'
require 'sidekiq'

# Initialize the rails application
DbcOverflow::Application.initialize!

