#
# cookbook name:: postfix-ses
# recipe:: default
#

package "postfix" do
  action :install
end

# create configuration files from templates
template "/etc/postfix/main.cf" do
  source "main.cf.erb"
  mode 0644
  owner "root"
  group "root"
  variables(
    :relayhost => node[:postfix_ses][:relayhost],
    :hostname => node[:opsworks][:instance][:hostname]
  )
  action :create
end

template "/etc/postfix/sasl_passwd" do
  source "sasl_passwd.erb"
  mode 0600
  owner "root"
  group "root"
  variables(
    :relayhost => node[:postfix_ses][:relayhost],
    :username => node[:postfix_ses][:username],
    :password => node[:postfix_ses][:password]
  )
  action :create
end

template "/etc/postfix/generic" do
  source "generic.erb"
  mode 0644
  owner "root"
  group "root"
  variables(
    :www_user => node[:postfix_ses][:www_user],
    :rewrites_ender => node[:postfix_ses][:rewrite_sender]
  )
  action :create
end

# create hashmap database files
script "create_a_hashmap_database_file" do
  interpreter "bash"
  user "root"
  code <<-EOH
    postmap hash:/etc/postfix/sasl_passwd
    chmod 0600 /etc/postfix/sasl_passwd /etc/postfix/sasl_passwd.db
  EOH
end

script "create_a_hashmap_generic_file" do
  interpreter "bash"
  user "root"
  code "postmap /etc/postfix/generic"
end

service "postfix" do
  action [ :enable, :restart ]
end