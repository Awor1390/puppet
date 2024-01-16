node 'slave1.puppet' {

class { 'apache':

  apache::vhost { 'vhost.example.com':
  port    => 80,
  docroot => '/var/www/vhost',
}
}

}
