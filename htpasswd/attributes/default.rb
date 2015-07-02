default['htpasswd']['install_method'] = 'packages' 

default['htpasswd']['built-in']['lang'] = 'python'

default['htpasswd']['path'] = value_for_platform_family(
  ['rhel', 'fedora', 'suse'] => '/etc/httpd/htpasswd',
  'debian' => '/etc/apache2/htpasswd'
)

default['htpasswd']['packages'] = value_for_platform_family(
  ['rhel', 'fedora', 'suse'] => ['httpd-tools'],
  'debian' => ['apache2-utils']
)
