#
# Cookbook Name:: rack_app
# Recipe:: configure
#
# Copyright (C) 2015 David Salazar
#
# All rights reserved - Do Not Redistribute
#

ns = node['ns'] # Namespace

template 'nginx.conf' do
  path   "#{node[ns]['nginx']['dir']}/nginx.conf"
  source 'nginx.conf.erb'
  owner  'root'
  group  node['root_group']
  mode   '0644'
end

cookbook_file "#{node[ns]['nginx']['dir']}/mime.types" do
  source 'mime.types'
  owner  'root'
  group  node['root_group']
  mode   '0644'
end

%w(nxensite nxdissite).each do |nxscript|
  template "#{node[ns]['nginx']['script_dir']}/#{nxscript}" do
    source "#{nxscript}.erb"
    mode   '0755'
    owner  'root'
    group  node['root_group']
  end
end

template "#{node[ns]['nginx']['dir']}/conf.d/passenger.conf" do
  cookbook "ccapp_passenger"
  source 'passenger.conf.erb'
  mode   '0644'
  owner  'root'
  group  node['root_group']
end
