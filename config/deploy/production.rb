set :stage, :production
set :branch, ENV['BRANCH'] || 'master'
set :rails_env, 'production'
set :username, 'glmrvn'
set :deploy_to, "/home/#{fetch(:username)}/#{fetch(:application)}/"
server '159.253.21.204', user: fetch(:username), roles: %w{web app db}
