#############################################################
# Application
#############################################################

set :application, "elmor.org.ua"
set :deploy_to, "/home/h41319/data/www/#{application}"

#############################################################
# Settings
#############################################################

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