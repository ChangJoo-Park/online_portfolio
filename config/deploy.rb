set :application, 'op'
set :user, 'deploy'
set :use_sudo, false
set :scm, :git
set :repo_url, 'git@github.com:pcjpcj2/online_portfolio.git'
set :branch, 'master'
set :rails_env,     "production"
set :linked_files, %w{config/database.yml}

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }
role  :web, '162.243.15.175'
role  :app, '162.243.15.175'
role  :db,  '162.243.15.175'
set :deploy_to, "/home/#{fetch :user}/apps/#{fetch :application}"

# Setup Symlinks
#   that should be created after each deployment


set :format, :pretty
set :log_level, :debug
set :pty, true

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :keep_releases, 5
# for RoR 4
set :default_env, { rvm_bin_path: '~/.rvm/bin' }
set :bundle_gemfile, -> { release_path.join('Gemfile') }
set :bundle_dir, -> { shared_path.join('bundle') }
set :bundle_flags, ''
set :bundle_without, %w{test development}.join(' ')
set :bundle_binstubs, -> { shared_path.join('bin') }
set :bundle_roles, :all

namespace :deploy do
  desc 'Restart application'
  task :start do ; end
  task :stop do ; end
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  task :precompile do
    on roles :web do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :bundle, "exec rake assets:precompile RAILS_ENV=production"
        end
      end
    end
  end


  after :finishing, 'deploy:cleanup'

end
