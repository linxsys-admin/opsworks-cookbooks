#
# cookbook name:: cloudwatch_logs
# recipe:: config
#

template '/tmp/cwlogs.cfg' do
  source 'cwlogs.cfg.erb'
  owner 'root'
  group 'root'
  mode 0644
  action :create
end