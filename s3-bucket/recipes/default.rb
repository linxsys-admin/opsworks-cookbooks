#
# cookbook:: s3-bucket
# recipe:: default
#

package "s3cmd" do
  action :install
end

template "/root/.s3cfg" do
  source "s3cfg.erb"
  mode "0644"
  owner "root"
  group "root"
  variables(
    :access_key => node[:s3bucket][:access_key],
    :secret_key => node[:s3bucket][:secret_key]
  )
  action :create
end