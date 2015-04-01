ns = default['ns'] = 'rack_stack'

default[ns]['omnibus_pkg_name']     = package_name = 'ruby-passenger-nginx'
default[ns]['install_path']         = install_path = "/opt/#{package_name}/embedded"
default[ns]['build_iteration']      = '1'
default[ns]['ruby']['version']      = '2.2.1'

default[ns]['passenger']['version'] = passenger_version = '5.0.5'
default[ns]['nginx']['passenger']['ruby']    = "#{install_path}/bin/ruby"
default[ns]['nginx']['passenger']['root']    = "#{install_path}/lib/ruby/gems/2.2.0/gems/passenger-#{passenger_version}"

default[ns]['nginx']['version']        = '1.6.2'
default[ns]['nginx']['user']           = 'www-data'
default[ns]['nginx']['group']          = 'www-data'
default[ns]['nginx']['dir']            = '/etc/nginx'
default[ns]['nginx']['script_dir']     = '/usr/sbin'
default[ns]['nginx']['log_dir']        = '/var/log/nginx'
default[ns]['nginx']['binary']         = "#{install_path}/sbin/nginx"
default[ns]['nginx']['default_root']   = '/var/www/nginx-default'
default[ns]['nginx']['daemon_disable'] = true
default[ns]['nginx']['pid']            = '/var/run/nginx.pid'

default[ns]['nginx']['gzip']              = 'on'
default[ns]['nginx']['gzip_static']       = 'off'
default[ns]['nginx']['gzip_http_version'] = '1.0'
default[ns]['nginx']['gzip_comp_level']   = '2'
default[ns]['nginx']['gzip_proxied']      = 'any'
default[ns]['nginx']['gzip_vary']         = 'off'
default[ns]['nginx']['gzip_buffers']      = nil
default[ns]['nginx']['gzip_types'] = %w(
  text/plain
  text/css
  application/x-javascript
  text/xml
  application/xml
  application/rss+xml
  application/atom+xml
  text/javascript
  application/javascript
  application/json
  text/mathml
)
default[ns]['nginx']['gzip_min_length']   = 1_000
default[ns]['nginx']['gzip_disable']      = 'MSIE [1-6]\.'

default[ns]['nginx']['keepalive']            = 'on'
default[ns]['nginx']['keepalive_timeout']    = 65
default[ns]['nginx']['worker_processes']     = node['cpu'] && node['cpu']['total'] ? node['cpu']['total'] : 1
default[ns]['nginx']['worker_connections']   = 1_024
default[ns]['nginx']['worker_rlimit_nofile'] = nil
default[ns]['nginx']['multi_accept']         = false
default[ns]['nginx']['event']                = nil
default[ns]['nginx']['server_tokens']        = nil
default[ns]['nginx']['server_names_hash_bucket_size'] = 64
default[ns]['nginx']['sendfile'] = 'on'

default[ns]['nginx']['access_log_options']     = nil
default[ns]['nginx']['error_log_options']      = nil
default[ns]['nginx']['disable_access_log']     = false
default[ns]['nginx']['install_method']         = 'package'
default[ns]['nginx']['types_hash_max_size']    = 2_048
default[ns]['nginx']['types_hash_bucket_size'] = 64
#default['nginx']['default_site_enabled']   = true

default[ns]['nginx']['proxy_read_timeout']      = nil
default[ns]['nginx']['client_body_buffer_size'] = nil
default[ns]['nginx']['client_max_body_size']    = nil
default[ns]['nginx']['default']['modules']      = []


default[ns]['nginx']['passenger']['passenger_default_user'] = 'deploy'
default[ns]['nginx']['passenger']['spawn_method'] = 'smart-lv2'
default[ns]['nginx']['passenger']['buffer_response'] = 'on'
default[ns]['nginx']['passenger']['max_pool_size'] = 6
default[ns]['nginx']['passenger']['min_instances'] = 1
default[ns]['nginx']['passenger']['max_instances_per_app'] = 0
default[ns]['nginx']['passenger']['pool_idle_time'] = 300
default[ns]['nginx']['passenger']['max_requests'] = 0
default[ns]['nginx']['passenger']['gem_binary'] = nil
