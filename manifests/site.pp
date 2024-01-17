node 'slave1.puppet' {

  class { 'apache':
    default_vhost => false,
  }

  apache::vhost { 'a.example.com':
    port    => 80,
    docroot => '/var/www/a.example.com',
  }

  class { '::php':
    ensure       => latest,
    manage_repos => true,
    fpm          => true,
    dev          => true,
    composer     => true,
    pear         => true,
    phpunit      => false,
  }

}


node 'slave2.puppet' {

  class { 'apache':
    default_vhost => false,
  }

  apache::vhost { 'b.example.com':
    port    => 80,
    docroot => '/var/www/b.example.com',
  }

  class { '::php':
    ensure       => latest,
    manage_repos => true,
    fpm          => true,
    dev          => true,
    composer     => true,
    pear         => true,
    phpunit      => false,
  }

}
