#
# cookbook name:: ebs-snapshot
# recipe:: default
#

package 'python-pip' do 
  action :install
end

script 'install_awscli_tool' do
  interpreter 'bash'
  user 'root'
  code '/usr/bin/pip install awscli'
end

directory '/opt/ebs-snapshot' do
  owner 'root'
  group 'root'
  mode 0755
  action :create
  recursive true
end

cookbook_file '/opt/ebs-snapshot/ebs-snapshot.sh' do
  source 'ebs-snapshot.sh'
  owner 'root'
  group 'root'
  mode 0755
  action :create
end

cron_env = { "PATH" => "/usr/local/bin:$PATH", "AWS_CONFIG_FILE" => "/root/.aws/config" }
cron 'setup_ebs-snapshot_cron_task' do
  environment cron_env
  minute '55'
  hour '23'
  user 'root'
  command '/opt/ebs-snapshot/ebs-snapshot.sh >> /opt/ebs-snapshot/ebs-snapshot.log 2>&1'
end

directory '/root/.aws' do
  owner 'root'
  group 'root'
  mode 0755
  action :create
  recursive true
end

template 'create_config_file_for_awscli' do
  source 'aws_config.erb'
  owner 'root'
  group 'root'
  mode '0600'
end

template 'create_credentials_file_for_awscli' do
  source 'aws_credentials.erb'
  owner 'root'
  group 'root'
  mode '0600'
end
