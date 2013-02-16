# require 'bundler/capistrano'

# after "deploy:update_code", :copy_database_config
# task :copy_database_config, roles => :app do
#   db_config = "#{shared_path}/config/database.yml"
#   run "cp #{db_config} #{release_path}/config/database.yml"
# end

# before 'deploy:finalize_update', 'set_current_release'
# task :set_current_release, :roles => :app do
#     set :current_release, latest_release
# end

# set :keep_releases, 5
# after "deploy:restart", "deploy:cleanup"

# load 'deploy/assets'

# ssh_options[:forward_agent] = true
# on :start do
#   `ssh-add`
# end
#  after "deploy:update_code", "deploy:migrate"

# # ***************************************
# # homepage application begin
# # ***************************************
# task  :homepage do

#   set :application,     "elmor.org.ua"

#   set :deploy_server,   "h33.hvosting.ua"

#   set :bundle_without,  [:development, :test]

#   set :user,            "h41319"
#   set :login,           "h41319"
#   set :use_sudo,        false
#   set :deploy_to,       "/home/#{user}/www/#{application}"
#   set :unicorn_conf,    "/etc/unicorn/#{application}.#{login}.rb"
#   set :unicorn_pid,     "/var/run/unicorn/#{application}.#{login}.pid"
#   set :bundle_dir,      File.join(fetch(:shared_path), 'gems')
#   role :web,            deploy_server
#   role :app,            deploy_server
#   role :db,             deploy_server, :primary => true


#   set :rvm_ruby_string, "1.9.3"
#   set :rake,            "rvm use #{rvm_ruby_string} do bundle exec rake"
#   set :bundle_cmd,      "rvm use #{rvm_ruby_string} do bundle"


#   set :scm,             :git
#   set :repository,  "git@github.com:Asmmund/homepage.git"
#   set :branch, "master"

#   # set cashing for other files
#   # set :deploy_via, :remote_cache
#     set :unicorn_start_cmd, "(cd #{deploy_to}/current; rvm use #{rvm_ruby_string} do bundle exec unicorn_rails -Dc #{unicorn_conf})"
#   # - for unicorn - #
#   namespace :deploy do
#     desc "Start application"
#     task :start, :roles => :app do

#       run unicorn_start_cmd
#     end

#     desc "Stop application"
#     task :stop, :roles => :app do
#       run "[ -f #{unicorn_pid} ] && kill -QUIT `cat #{unicorn_pid}`"
#     end

#     desc "Restart Application"
#     task :restart, :roles => :app do
#       run "[ -f #{unicorn_pid} ] && kill -USR2 `cat #{unicorn_pid}` || #{unicorn_start_cmd}"
#     end
#   end
# end


require 'bundler/capistrano'
# setting up params
set :user, 'h41319'
set :use_sudo, false
set :domain, 'elmor.org.ua'
set :applicationdir, "~/www/#{domain}"
set :scm, 'git'
set :repository,  "git@github.com:Asmmund/homepage.git"
set :git_enable_submodules, 1 # if you have vendored rails
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true
after "deploy:update_code", :copy_database_config
task :copy_database_config, roles => :app do
  db_config = "#{shared_path}/config/database.yml"
  run "cp #{db_config} #{release_path}/config/database.yml"
end

  set :rvm_ruby_string, "1.9.3"
  set :rake,            "rvm use #{rvm_ruby_string} do bundle exec rake"
  set :bundle_cmd,      "rvm use #{rvm_ruby_string} do bundle"

# after "deploy:update_code", :set_bundler
# task :set_bundler, roles => :app do
#   run "#{bundle_cmd}"
# end

# assigning all roles to one server
server domain, :app, :web, :db, :primary => true
ssh_options[:forward_agent] = true
on :start do
  `ssh-add`
end

# deploy config
set :deploy_to, applicationdir
# set :deploy_via, :remote_cache
after 'deploy:update_code', 'deploy:migrate'
# additional settings
default_run_options[:pty] = true  # Forgo errors when deploying from windows
#ssh_options[:keys] = %w(/home/user/.ssh/id_rsa)
# If you are using ssh_keysset :chmod755, "app config db lib public vendor script script/* public/disp*"

set :keep_releases, 5
after "deploy:restart", "deploy:cleanup"
# Passenger
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end