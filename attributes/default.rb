ns = default['ns'] = 'rack_stack'

default[ns]['omnibus_pkg_name']     = package_name = 'ruby-passenger-nginx'
default[ns]['install_path']         = install_path = "/opt/#{package_name}/embedded"
default[ns]['build_iteration']      = '1'
default[ns]['ruby']['version']      = '2.2.1'
default[ns]['nginx']['version']     = '1.6.2'
default[ns]['passenger']['version'] = passenger_version = '5.0.5'

override['nginx']['binary']               = "#{install_path}/sbin/nginx"
override['nginx']['src_binary']           = node['nginx']['binary']
override['nginx']['pid']                  = '/var/run/nginx.pid'
override['nginx']['passenger']['ruby']    = "#{install_path}/bin/ruby"
override['nginx']['passenger']['root']    = "#{install_path}/lib/ruby/gems/2.2.0/gems/passenger-#{passenger_version}"
