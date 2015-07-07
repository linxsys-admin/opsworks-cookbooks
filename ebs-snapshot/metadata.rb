name              'ebs-snapshot'
maintainer        'Tom Skibinski'
maintainer_email  'tomasz.skibinski@linxsys.pl'
description       'Configured bash script for EBS snapshots'
license           'Apache 2.0'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '0.1.0'

%w( ubuntu debian ).each do |os|
  supports os
end