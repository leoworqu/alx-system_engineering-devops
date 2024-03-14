# replace_15_with_4096 

exec { 'replace_15_with_4096':
  command => 'sed -i "s/15/4096/g" /etc/default/nginx',
  path    => '/bin:/usr/bin',
}
