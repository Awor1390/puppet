node 'slave1.puppet' {
  class { 'apache':
    listen => ['80', '443'],
    mpm    => 'prefork',
  }
  
  file { '/var/www/html/index.html':
    ensure => file,
    content => "Привет, мир!\n",
  }  
}
