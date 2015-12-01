#
# cookbook:: crontasks
# recipe:: clean_uploaded_files
#

cron "wp_cron_clean" do
  minute "0"
  hour "0"
  user "root"
  node[:deploy].each do |app, deploy|
    command "find #{node[:deploy][app][:deploy_to]}/shared/uploads/{2010..2016}/{1..12}/ -type f -mtime +1 -exec rm -f {} \\;"
  end
end
