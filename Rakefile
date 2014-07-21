#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

NotificationCentre::Application.load_tasks

desc 'Generate a new ZIP package for Elastic Beanstalk based upon the current git SHA1'
task :package do
  sha = `git rev-parse --verify HEAD`.chomp
  sh "git archive --format=zip HEAD > packages/notification-#{sha[0..8]}.zip"
end