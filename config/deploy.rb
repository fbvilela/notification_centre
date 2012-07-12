set :application, "notification_centre"
set :repository,  "https://github.com/fbvilela/notification_centre.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

task :amazon do 
  set :rails_env, "production"
  ssh_options[:user] = "ec2-user"
  ssh_options[:keys] = [File.join("~/.ssh/iproperty-ec2.pem")]
  role :web, "184.169.130.114" # Your HTTP server, Apache/etc
  role :app, "184.169.130.114" # This may be the same as your `Web` server
  role :db,  "184.169.130.114", :primary => true # This is where Rails migrations will run  
end