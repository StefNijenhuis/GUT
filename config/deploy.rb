set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }

set :application, 'gut'
set :repo_url, 'git@github.com:StefNijenhuis/GUT.git'

set :deploy_to, "/home/dirk/#{fetch(:application)}"

set :format, :pretty
set :pty, true

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  before :finishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'

end
