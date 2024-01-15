class { '::apache':
  listen => ['80'],
  mpm => 'event',
  package => 'apache2',
}

file { '/var/www/html/index.html':
  ensure => file,
  content => "Hello, World!\n",
}
