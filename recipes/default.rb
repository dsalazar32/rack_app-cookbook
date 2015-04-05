#
# Cookbook Name:: rack_app
# Recipe:: default
#
# Copyright (C) 2015 David Salazar
#
# All rights reserved - Do Not Redistribute
#

ns = node['ns'] # Namespace

package_version = [
  node[ns]['ruby']['version'], 
  node[ns]['passenger']['version'], 
  node[ns]['nginx']['version']]

packagecloud_repo 'dsalazar/iomediums' do
  type 'deb'
end

package node[ns]['omnibus_pkg_name'] do
  version "#{package_version.join('~')}-#{node[ns]['build_iteration']}"
end

# Need to generate this symlink because it seems that chef-client does not
# respect the omnibus package directory.
# link "/usr/bin/git" do
#   to "#{node[ns]['install_path']}/bin/git"
# end
