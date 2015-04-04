#
# Cookbook Name:: rack_app
# Recipe:: configure
#
# Copyright (C) 2015 David Salazar
#
# All rights reserved - Do Not Redistribute
#

#ns = node['ns'] # Namespace

#template 'nginx.conf' do
#  path   "#{node[ns]['nginx']['dir']}/nginx.conf"
#  source 'nginx.conf.erb'
#  owner  'root'
#  group  node['root_group']
#  mode   '0644'
#end
#


#%w(nxensite nxdissite).each do |nxscript|
#  template "#{node[ns]['nginx']['script_dir']}/#{nxscript}" do
#    source "#{nxscript}.erb"
#    mode   '0755'
#    owner  'root'
#    group  node['root_group']
#  end
#end
#
#
#template "#{node[ns]['nginx']['dir']}/sites-enabled/nginx_status" do
#  source 'nginx_status.erb'
#  mode   '0644'
#  owner  'root'
#  group  node['root_group']
#end
#

include_recipe 'rack_app::_service'
include_recipe 'nginx::commons'

cookbook_file "#{node['nginx']['dir']}/mime.types" do
  source 'mime.types'
  owner  'root'
  group  node['root_group']
  mode   '0644'
end

template "#{node['nginx']['dir']}/conf.d/passenger.conf" do
  source 'passenger.conf.erb'
  mode   '0644'
  owner  'root'
  group  node['root_group']
end
