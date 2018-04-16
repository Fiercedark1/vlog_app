#working_directory "/vlog_app/"
#pid "/vlog_app/pids/unicorn.pid"
#stderr_path "/var/log/unicorn.stderr.log"
#stdout_path "/var/log/unicorn.stdout.log"
# set path to application
app_dir = "/vlog_app/"
shared_dir = "#{app_dir}/shared"
working_directory app_dir


# Set unicorn options
worker_processes 2
preload_app true
timeout 30

# Set up socket location
listen "#{shared_dir}/sockets/unicorn.sock", :backlog => 64

# Logging
stderr_path "#{shared_dir}/log/unicorn.stderr.log"
stdout_path "#{shared_dir}/log/unicorn.stdout.log"

# Set master PID location
pid "#{shared_dir}/pids/unicorn.pid"
