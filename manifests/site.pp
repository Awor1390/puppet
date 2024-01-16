node 'slave1.puppet' {

    class { 'apache': }             # use apache module
    apache::vhost { 'example.com':  # define vhost resource
      port    => '80',
      docroot => '/var/www/html'
  }
}
