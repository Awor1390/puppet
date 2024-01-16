node 'slave1.puppet' {

  class { 'apache':
    default_vhost => false,
  }

  apache::vhost { 'vhost.static.com':
    port    => 80,
    docroot => '/var/www/a.example.com',
  }

  file { '/vagrant/files/index.html':
    ensure => '/var/www/a.example.com/index.html',
  }

}


node 'slave2.puppet' {

  class { 'apache':
    default_vhost => false,
  }

  apache::vhost { 'vhost.dynamic.com':
    port    => 80,
    docroot => '/var/www/b.example.com',
  }

  file { '/vagrant/files/index.php':
    ensure => '/var/www/b.example.com/index.php',
  }

}
