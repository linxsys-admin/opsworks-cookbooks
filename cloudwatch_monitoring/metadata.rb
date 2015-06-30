name             'cloudwatch_monitoring'
maintainer       'Tom Skibinski'
maintainer_email 'tomasz.skibinski@linxsys.pl'
license          'Apache 2.0'
description      'cloudwatch_monitoring installs the Amazon CloudWatch Monitoring Scripts for Linux - custom metrics that reports memory, swap, and disk space utilization metrics.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version "1.3.0"

%w{ ubuntu debian redhat centos}.each do |os|
  supports os
end
