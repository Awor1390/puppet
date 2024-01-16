node 'slave1.puppet' {

class { 'apache':
  default_vhost => false,
}

apache::vhost { 'vhost.example.com':
  port    => 80,
  docroot => '/var/www/vhost',
}

}
