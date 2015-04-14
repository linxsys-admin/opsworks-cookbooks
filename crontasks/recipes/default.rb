#
# cookbook:: crontasks
# recipe:: default
#

template "/root/s3_sync.sh" do
  source "s3_sync.sh.erb"
  mode "0755"
  owner "root"
  group "root"
  variables(
    :bucket_name => node[:crontasks][:bucket_name]
  )
  action :create
end

cron "s3_sync" do
 minute "*/5"
 user "root"
 command "/root/s3_sync.sh"
end

cron "wp_cron" do
  minute "*/15"
  user "root"
  command "wget -q -O - http://localhost/wp-cron.php?doing_wp_cron >/dev/null 2>&1"
end