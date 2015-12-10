#
# cookbook:: crontasks
# recipe:: clean_uploaded_files
#

node[:deploy].each do |app, deploy|

  file "#{deploy[:deploy_to]}/shared/clean.sh" do
    content %Q|#!/bin/bash
find #{deploy[:deploy_to]}/shared/uploads/20??/{01..12}/ -type f -mtime +1 -exec rm -f {} \\;
|
    mode "0755"
    owner "root"
  end

  cron "wp_cron_clean" do
    minute "0"
    hour "0"
    user "root"
    command "#{deploy[:deploy_to]}/shared/clean.sh"
  end
end

