node 'slave1.puppet' {

  class { 'apache':
    default_vhost => false,
  }

  apache::vhost { 'a.example.com':
    port    => 80,
    docroot => '/var/www/a.example.com',
  }

  file { '/var/www/a.example.com/index.html':
            ensure => present,
            source => '/vagrant/files/index.html',
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

  file { '/var/www/b.example.com/index.php':
            ensure => present,
            source => '/vagrant/files/index.php',
  }

}
