
listen "/tmp/notifications.sock", :backlog => 64
listen 8082, :tcp_nopush => true
# nuke workers after 30 seconds instead of 60 seconds (the default)
timeout 30
worker_processes 3 # this should be >= nr_cpus
pid "/u/apps/notification_centre/shared/pids/mobilewebsites.pid"
stderr_path "/u/apps/notification_centre/shared/log/unicorn.log"
stdout_path "/u/apps/notification_centre/shared/log/unicorn.log"
preload_app true