
task  :homepage do
  set :application, 'elmor.org.ua'
  require 'bundler/capistrano'
  require 'capistrano-unicorn'
 set :default_environment, {
      'PATH' => "/opt/ruby-enterprise/bin/:$PATH"
    }
  # setting up params
  set :user, 'h41319'
  set :use_sudo, false
  set :domain, 'elmor.org.ua'
  set :deploy_server, 'h33.hvosting.ua'
  set :applicationdir, "~/www/#{domain}"
  set :scm, 'git'
  set :repository,  "git@github.com:Asmmund/homepage.git"
  set :git_enable_submodules, 1 # if you have vendored rails
  set :branch, 'master'
  set :git_shallow_clone, 1
  set :scm_verbose, true

  after 'deploy:restart', 'unicorn:restart'
  after "deploy:update_code", :copy_database_config
  task :copy_database_config, roles => :app do
    db_config = "#{shared_path}/config/database.yml"
    run "cp #{db_config} #{release_path}/config/database.yml"
  end



set :rvm_ruby_string, '1.9.3'
    # set :rvm_ruby_string, "1.9.3"
    # set :rake,            "rvm use #{rvm_ruby_string} do bundle exec rake"
    # set :bundle_cmd,      "rvm use #{rvm_ruby_string} do bundle"

  # after "deploy:update_code", :set_bundler
  # task :set_bundler, roles => :app do
  #   run "#{bundle_cmd}"
  # end

  # assigning all roles to one server
  server deploy_server, :app, :web, :db, :primary => true
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
  # If 3ou are using ssh_keysset :chmod755, "app config db lib public vendor script script/* public/disp*"

  set :keep_releases, 5
  after "deploy:restart", "deploy:cleanup"

end
