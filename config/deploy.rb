# config valid only for current version of Capistrano
lock '3.4.0'

require 'unicorn'

#set :whenever_command, "bundle exec whenever"
#require "whenever/capistrano"

set :application, 'InfinityImgs'
#require "whenever/capistrano"


# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'

# Default value for :scm is :git
set :scm, :git

set :repo_url, 'git@github.com:ggomagundan/unlimited_image.git'
# Default value for :format is :pretty
#set :branch,  'master'
set :deploy_via, :remote_cache
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
set :default_env, { path: "/root/.rbenv/versions/2.2.2/lib/ruby/gems:/root/.rbenv/versions/2.2.2/bin:$PATH" }
#set :current_deploy_path, "/geuinea_pig/priday/current"

# Default value for keep_releases is 5
# set :keep_releases, 5


set :ssh_options, { :forward_agent => true}


namespace :whenever do
  task :start do 
    on roles(:app) do
      execute("cd #{fetch :current_deploy_path}")
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :bundle, 'exec whenever --update-crontab'
        end
      end
    end
  end
end

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

 before 'deploy:assets:precompile', :link_assets
 task :link_assets do
    on roles(:app), :roles => :app, :except => { :no_release => true } do
      execute("ln -fs #{shared_path}/mongoid.yml #{release_path}/config/mongoid.yml")
      execute("ln -fs #{shared_path}/uploads #{release_path}/public/uploads")

    end
  end


  task :make_unicorn do
    on roles(:app), in: :sequence, wait: 8 do

      execute("cp #{shared_path}/unicorn.rb  #{fetch :current_deploy_path}/config/unicorn.rb")
      execute("cd #{fetch :current_deploy_path}")
      execute("if [ -f #{shared_path}/pids/unicorn.pid ]; then kill -s QUIT `cat #{shared_path}/pids/unicorn.pid`; fi")
      # Wait until unicorn process die
      execute("if [ -f #{shared_path}/pids/unicorn.pid ]; then while ps -p `cat #{shared_path}/pids/unicorn.pid` > /dev/null; do echo 'wait until unicorn process die'; sleep 0.1; done; fi")
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :bundle, 'exec unicorn -D -c config/unicorn.rb -E production'
        end
      end
    end
  end



  task :restart_unicorn do
    on roles(:app), in: :sequence, wait: 8 do

      execute("cp #{shared_path}/unicorn.rb  #{fetch :current_deploy_path}/config/unicorn.rb")
      execute("cd #{fetch :current_deploy_path}")
      execute("service unlimited force-restart")

    end
  end

 after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end


  after 'deploy:publishing', :restart_unicorn
  after 'deploy:finishing', 'whenever:start'

end
