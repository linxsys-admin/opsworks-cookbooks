#
# Cookbook Name:: htpasswd
# Recipe:: setup_basic_auth
#

htpasswd "#{node['htpasswd']['path'}" do
  user "#{node['htpasswd']['user']}"
  password "#{node['htpasswd']['password']}"
end
