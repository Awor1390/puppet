node 'slave1.puppet' {
  class { 'apache':
    listen => ['80', '443'],
    mpm    => 'prefork',
  }

  apache::vhost { 'vhost.example.com':
    port    => 80,
    docroot => '/var/www/html',
}
  
  file { '/var/www/html/index.html':
    ensure => file,
    content => "Привет, мир!\n",
  }  
}
