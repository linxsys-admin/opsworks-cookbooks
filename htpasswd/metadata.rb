name 'htpasswd'
maintainer       'Tom Skibinski'
maintainer_email 'tomasz.skibinski@linxsys.pl'
license 'Apache 2.0'
description 'Provider for htpasswd'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.3.0'

%w( ubuntu debian centos redhat fedora ).each do |os|
  supports os
end
