# Fix problem of "Too many open files"

exec { 'update_limits':
  provider => shell,
  command  => 'sed -i "s/nofile 5/nofile 50000/" /etc/security/limits.conf; sed -i "s/nofile 4/nofile 40000/" /etc/security/limits.conf',
}
