# This is a sample Capistrano config file for EC2 on Rails.
# It should be edited and customized.
default_run_options[:pty] = true

set :application, "stationlost"

set :scm, :git
set :repository, "git@github.com:smartocci/stationlost.git"
set :branch, "master"
set :user, "root"
set :git_enable_submodules, 1
set :deploy_via, :remote_cache
#might not need this
ssh_options[:forward_agent] = true


# NOTE: for some reason Capistrano requires you to have both the public and
# the private key in the same folder, the public key should have the 
# extension ".pub".
ssh_options[:keys] = ["#{ENV['HOME']}/.ssh/awesomesauce"]

# Your EC2 instances. Use the ec2-xxx....amazonaws.com hostname, not
# any other name (in case you have your own DNS alias) or it won't
# be able to resolve to the internal IP address.
role :web,      "ec2-75-101-136-136.compute-1.amazonaws.com"
role :app,      "ec2-75-101-136-136.compute-1.amazonaws.com"
role :db,       "ec2-75-101-136-136.compute-1.amazonaws.com", :primary => true
role :memcache, "ec2-75-101-136-136.compute-1.amazonaws.com"

# Whatever you set here will be taken set as the default RAILS_ENV value
# on the server. Your app and your hourly/daily/weekly/monthly scripts
# will run with RAILS_ENV set to this value.
set :rails_env, "production"

# EC2 on Rails config. 
# NOTE: Some of these should be omitted if not needed.
set :ec2onrails_config, {
  # S3 bucket and "subdir" used by the ec2onrails:db:restore task
  :restore_from_bucket => "stationlost",
  :restore_from_bucket_subdir => "database",
  
  # S3 bucket and "subdir" used by the ec2onrails:db:archive task
  # This does not affect the automatic backup of your MySQL db to S3, it's
  # just for manually archiving a db snapshot to a different bucket if 
  # desired.
  :archive_to_bucket => "stationlost",
  :archive_to_bucket_subdir => "db-archive/#{Time.new.strftime('%Y-%m-%d--%H-%M-%S')}",
  
  # Set a root password for MySQL. Run "cap ec2onrails:db:set_root_password"
  # to enable this. This is optional, and after doing this the
  # ec2onrails:db:drop task won't work, but be aware that MySQL accepts 
  # connections on the public network interface (you should block the MySQL
  # port with the firewall anyway). 
  # If you don't care about setting the mysql root password then remove this.
  #:mysql_root_password => "your-mysql-root-password",
  
  # Any extra Ubuntu packages to install if desired
  # If you don't want to install extra packages then remove this.
  :packages => ["logwatch", "imagemagick"],
  
  # Any extra RubyGems to install if desired: can be "gemname" or if a 
  # particular version is desired "gemname -v 1.0.1"
  # If you don't want to install extra rubygems then remove this
  :rubygems => ["haml"],
  
  # Set the server timezone. run "cap -e ec2onrails:server:set_timezone" for 
  # details
  :timezone => "Canada/Eastern",
  
  # Files to deploy to the server (they'll be owned by root). It's intended
  # mainly for customized config files for new packages installed via the 
  # ec2onrails:server:install_packages task. Subdirectories and files inside
  # here will be placed in the same structure relative to the root of the
  # server's filesystem. 
  # If you don't need to deploy customized config files to the server then
  # remove this.
  :server_config_files_root => "../server_config",
  
  # If config files are deployed, some services might need to be restarted.
  # If you don't need to deploy customized config files to the server then
  # remove this.
  :services_to_restart => %w(apache2 postfix sysklogd),
  
  # Set an email address to forward admin mail messages to. If you don't
  # want to receive mail from the server (e.g. monit alert messages) then
  # remove this.
  :admin_mail_forward_address => "smartocci@gmail.com",
  
  # Set this if you want SSL to be enabled on the web server. The SSL cert 
  # and key files need to exist on the server, The cert file should be in
  # /etc/ssl/certs/default.pem and the key file should be in
  # /etc/ssl/private/default.key (see :server_config_files_root).
  :enable_ssl => true
}
