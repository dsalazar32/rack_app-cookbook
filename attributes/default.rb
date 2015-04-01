ns = default['ns'] = 'rack_stack'

default[ns]['omnibus_pkg_name']     = package_name = 'ruby-passenger-nginx'
default[ns]['install_path']         = install_path = "/opt/#{package_name}/embedded"
default[ns]['build_iteration']      = '1'
default[ns]['ruby']['version']      = '2.2.1'

default[ns]['passenger']['version'] = passenger_version = '5.0.5'
default[ns]['passenger']['ruby']    = "#{install_path}/bin/ruby"
default[ns]['passenger']['root']    = "#{install_path}/lib/ruby/gems/2.1.0/gems/passenger-#{passenger_version}"

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
