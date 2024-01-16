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

  file { "/var/www/a.example.com/index.html":
    mode => 644,
    owner => root,
    group => root,
    source => "/vagrant/index.html"
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


  file { "/var/www/b.example.com/index.php":
    mode => 644,
    owner => root,
    group => root,
    source => "/vagrant/index.php"
  }

}
