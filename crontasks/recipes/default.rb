#
# cookbook:: crontasks
# recipe:: default
#

cron "wp_cron" do
  minute "*/15"
  user "root"
  command "wget -q -O - http://localhost/wp-cron.php?doing_wp_cron >/dev/null 2>&1"
end
