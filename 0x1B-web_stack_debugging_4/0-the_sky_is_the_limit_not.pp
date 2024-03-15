# replace rhe ulimit

exec { 'increase file limit for nginx':
  onlyif  => 'test -e /etc/default/nginx',
  command => "/bin/bash -c 'sed -i \"5s/[0-9]\\+/$$(ulimit -n)/\" /etc/default/nginx && service nginx restart'",
  provider => shell,
}
