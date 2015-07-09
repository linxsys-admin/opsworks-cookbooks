name             'cloudwach_logs'
maintainer       'Tom Skibinski'
maintainer_email 'tomasz.skibinski@linxsys.pl'
license          'Apache 2.0'
version          '0.1.0'

%w{ ubuntu debian }.each do |os|
  supports os
end