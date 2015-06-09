#
# cookbook:: crontasks-ggf
# recipe:: default
# Created for GoGetFunding.com website - to use on blog OpsWorks stack
# 

cron "update_project - once per day" do
  minute "00"
  hour "01"
  user "root"
  command "wget -q -O - http://gogetfunding.com/cron-functions/?func=update_project >/dev/null 2>&1"
end

cron "update_reminder - once per day" do
  minute "00"
  hour "02"
  user "root"
  command "wget -q -O - http://gogetfunding.com/cron-functions/?func=update_reminder >dev/null 2>&1"
end

cron "redis_cron_view_count_updator - once every minute" do
  minute "*/1"
  user "root"
  command "wget -q -O - http://gogetfunding.com/wp-content/themes/ggf/redis_cron_view_count_updator.php >/dev/null 2>&1"
end

cron "update_error_fund - once per hour" do
  minute "10"
  user "root"
  command "wget -q -O - http://gogetfunding.com/cron-functions/?func=update_error_fund >/dev/null 2>&1"
end

cron "update_fund - run every 15 minutes" do
  minute "*/15"
  user "root"
  command "wget -q -O - http://gogetfunding.com/cron-functions/?func=update_fund >/dev/null 2>&1"
end

cron "bounce_complaint_fetcher.php - run every 1 hour" do
  minute "20"
  user "root"
  command "wget -q -O - http://gogetfunding.com/wp-content/themes/ggf/AWS/bounce_complaint_fetcher.php >/dev/null 2>&1"
end
