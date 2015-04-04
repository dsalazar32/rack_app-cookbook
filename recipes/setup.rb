#
# Cookbook Name:: rack_app
# Recipe:: setup
#
# Copyright (C) 2015 David Salazar
#
# All rights reserved - Do Not Redistribute
#

require 'chef/util/file_edit'

ns = node['ns'] # Namespace

path = [
  "#{node[ns]['install_path']}/sbin",
  "#{node[ns]['install_path']}/bin",
  '/usr/local/bin',
  '/usr/local/sbin',
  '/usr/bin',
  '/usr/sbin',
  '/bin',
  '/sbin'
]

file '/etc/profile.d/env.sh' do
  action :create_if_missing
  owner 'root'
  group 'root'
  mode  '0755'
end

ruby_block 'setup environment variables' do
  block do
    file = Chef::Util::FileEdit.new '/etc/profile.d/env.sh'
    match = /PATH/
    value = "PATH=#{path.join(':')}"
    file.search_file_replace_line(match, value)
    file.insert_line_if_no_match(match, value)
    file.write_file
  end
end

# directory node[ns]['nginx']['dir'] do
#   owner     'root'
#   group     node['root_group']
#   mode      '0755'
#   recursive true
# end
# 
# directory node[ns]['nginx']['log_dir'] do
#   mode      '0755'
#   owner     node[ns]['nginx']['user']
#   action    :create
#   recursive true
# end
# 
# directory File.dirname(node[ns]['nginx']['pid']) do
#   owner     'root'
#   group     node['root_group']
#   mode      '0755'
#   recursive true
# end
# 
# %w(sites-available sites-enabled conf.d).each do |leaf|
#   directory File.join(node[ns]['nginx']['dir'], leaf) do
#     owner 'root'
#     group node['root_group']
#     mode  '0755'
#   end
# end
