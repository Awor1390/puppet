class { 'apache':
  listen => ['80', '443'],
  mpm    => 'event',
  ssl    => true,
  dir    => '/var/www',
}

node 'slave1.puppet' {
  include 'apache'
}

node 'slave2.puppet' {
  include 'apache'
}
