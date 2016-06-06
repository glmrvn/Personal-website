rails_env = ENV['RAILS_ENV'] || 'development'
environment rails_env
threads 0, 16
workers 2
preload_app!
prune_bundler
