# Look for ruby gems here
source 'https://rubygems.org'

# Set required ruby version (for heroku)
ruby '2.2.3'

gem 'rails', '4.2.4'

# Reduce rails kitchen sink approach
gem 'rails-api'

# Cross-Origin Resource Sharing
gem 'rack-cors', require: 'rack/cors'

# Use PostgreSQL database
gem 'pg'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Help with JSON serialization
gem 'active_model_serializers'

# Use Authy
gem 'authy'

# Use Twilio
gem 'twilio-ruby', '~> 4.2.1'

# Use delayed_jobs
gem 'delayed_job_active_record'

# Need daemons to start delayed_job
gem 'daemons'

# Use workless to use less workers on heroku
gem "workless"

group :development do
  # Use pry over irb for rails console
  gem 'pry-rails'
  gem 'byebug'
  gem 'dotenv-rails'
end
