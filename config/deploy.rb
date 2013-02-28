set :application, "notification_centre"
set :repository,  "https://github.com/fbvilela/notification_centre.git"

set :scm, :git

task :amazon do   
  set :rails_env, "production"
  ssh_options[:user] = "ec2-user"
  ssh_options[:keys] = [File.join("~/.ssh/iproperty-ec2.pem")]
  role :web, "184.169.130.114" 
  role :app, "184.169.130.114" 
  role :db,  "184.169.130.114", :primary => true 
end

task :production do   
  default_run_options[:pty] = true
  set :rails_env, "production"
  ssh_options[:user] = "ec2-user"
  ssh_options[:keys] = [File.join("~/.ssh/iproperty-sydney-ec2.pem")]
  role :web, "54.252.86.61" 
  role :app, "54.252.86.61" 
  role :db,  "54.252.86.61", :primary => true   
end