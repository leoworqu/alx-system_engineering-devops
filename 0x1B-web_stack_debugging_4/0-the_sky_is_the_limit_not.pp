# replace_15_with_3999 

exec { 'replace_4096_with_3999':
  command => 'sed -i "s/15/3999/g" /etc/default/nginx',
  path    => '/bin:/usr/bin',
}