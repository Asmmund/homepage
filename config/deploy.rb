require "bundler/capistrano"
require "execjs"
# after "deploy:update_code", 'bundle:install'
# task 'bundle:install' do
#   run "cd #{release_path} && bundle install"

# end
   set :default_environment, {
      'PATH' => "/home/h41319/data/.rvm/gems/ruby-1.9.3-p385/bin/bundle
:$PATH"
    }
#############################################################
# Application
#############################################################

set :application, "elmor.org.ua"
set :deploy_to, "/home/h41319/data/www/#{application}"

#############################################################
# Settings
#############################################################
# Add RVM's lib directory to the load path.
set :rvm_ruby_string, ENV['GEM_HOME'].gsub(/.*\//,"")
set :rvm_install_ruby_params, '--1.9'      # for jruby/rbx default to 1.9 mode
set :rvm_install_pkgs, %w[libyaml openssl] # package list from https://rvm.io/packages
set :rvm_install_ruby_params, '--with-opt-dir=/usr/local/rvm/usr' # package support

before 'deploy:setup', 'rvm:install_rvm'   # install RVM
before 'deploy:setup', 'rvm:install_pkgs'  # install RVM packages before Ruby
before 'deploy:setup', 'rvm:install_ruby'  # install Ruby and create gemset, or:
before 'deploy:setup', 'rvm:create_gemset' # only create gemset
before 'deploy:setup', 'rvm:import_gemset' # import gemset from file
set :rvm_type, :local
# Load RVM's capistrano plugin.
require "rvm/capistrano"
set :rvm_ruby_string, "1.9.3"
set :rake,            "rvm use #{rvm_ruby_string} do bundle exec rake"
set :bundle_cmd,      "rvm use #{rvm_ruby_string} do bundle"
default_run_options[:pty] = true
set :use_sudo, true

ssh_options[:forward_agent] = true
on :start do
  `ssh-add`
end
#############################################################
# Servers
#############################################################

set :user, 'h41319'
set :deploy_server, 'h33.hvosting.ua'
set :scm, 'git'
server deploy_server, :app, :web
role :db, deploy_server, :primary => true

#############################################################
# Subversion
#############################################################

set :repository,  "git@github.com:Asmmund/homepage.git"
set :branch, 'master'
set :checkout, "export"

#############################################################
# Passenger
#############################################################

namespace :passenger do
  desc "Restart Application"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

after :deploy, "passenger:restart"