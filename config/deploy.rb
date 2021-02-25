lock '3.4.1'

set :application, 'okr-intern-v2'

set :repo_url, 'git@github.com:its532/okr-intern-v2.git'

set :branch, 'master'

set :deploy_to, '/var/www/rails/okr-intern-v2'

set :linked_files, fetch(:linked_files, []).push('config/credentials/production.key')

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

set :keep_releases, 5

set :rbenv_ruby, '2.7.1'

set :log_level, :debug

set :yarn_flags, '--prefer-offline --production'
set :yarn_roles, :app

namespace :deploy do
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end

  desc 'Create database'
  task :db_create do
    on roles(:db) do |host|
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:create'
        end
      end
    end
  end

  desc 'Run rake yarn:install'
  task :yarn_install do
    on roles(:web) do
      within release_path do
        execute("cd #{release_path} && yarn install")
      end
    end
  end

  desc 'Run seed'
  task :seed do
    on roles(:app) do
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:seed'
        end
      end
    end
  end

  before "deploy:assets:precompile", "deploy:yarn_install"

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
    end
  end
end
