# set path to application
app_dir = File.expand_path("../..", __FILE__)
shared_dir = "#{app_dir}/shared"
working_directory app_dir


# Set unicorn options
worker_processes 2
preload_app true
timeout 300

# Set up socket location
listen "#{shared_dir}/sockets/unicorn.sock", :backlog => 64

# Logging
stderr_path "#{shared_dir}/log/unicorn.stderr.log"
stdout_path "#{shared_dir}/log/unicorn.stdout.log"

# Set master PID location
pid "#{shared_dir}/pids/unicorn.pid"


# upstream rails {
# # Path to Unicorn socket file
# server unix:/home/apps/feedrunner/shared/sockets/unicorn.sock fail_timeout=0;
# }
#
#
# server {
# listen 80;
# server_name localhost;
#
# root /home/apps/feedrunner;
#
# try_files $uri/index.html $uri @rails;
#
# location @rails {
#    proxy_pass http://rails;
#    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
#     proxy_set_header Host $http_host;
#    proxy_redirect off;
# }
#
# error_page 500 502 503 504 /500.html;
# client_max_body_size 4G;
# keepalive_timeout 10;
# }
#

# sudo fuser -k 80/tcp
# service nginx restart
