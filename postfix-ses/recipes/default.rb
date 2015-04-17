#
# cookbook name:: postfix-ses
# recipe:: default
#

package "postfix" do
  action :install
end


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
  mode 0644
  owner "root"
  group "root"
  variables(
    :relayhost => node[:postfix_ses][:relayhost],
    :username => node[:postfix_ses][:username],
    :password => node[:postfix_ses][:password]
  )
  action :create
end

script "create_a_hashmap_database" do
  interpreter "bash"
  user "root"
  code <<-EOH
    postmap hash:/etc/postfix/sasl_passwd
    rm -f /etc/postfix/sasl_passwd
  EOH
end

service "postfix" do
  action [ :enable, :restart ]
end