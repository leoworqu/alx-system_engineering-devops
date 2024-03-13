# Fix problem of "Too many open files"

exec {'user_limit':
  provider => shell,
  command  => 'sed -i "s/nofile 5/nofile 50000/" /etc/security/limits.conf',
  before   => Exec['limits'],
}

exec {'limits':
  provider => shell,
  command  => 'sed -i "s/nofile 4/nofile 40000/" /etc/security/limits.conf',
}