node 'slave1.puppet' {

  #stop firewall
  # exec { 'stop firewalld':
  #   command => 'systemctl stop firewalld',
  #   refresh => true,
  # }

  #init apache
  class { 'apache':
    default_vhost => false,
  }

  #start apache on port 80
  apache::vhost { 'a.example.com':
    port    => 80,
    docroot => '/var/www/a.example.com',
  }

  #add stativ page as file
  file { '/var/www/a.example.com/index.html':
    ensure => file,
    source => '/vagrant/index.html',
  }  
}

node 'slave2.puppet' {

  #stop firewall
  # exec { 'stop firewalld':
  #   command => 'systemctl stop firewalld',
  #   refresh => true,
  # }

  #init apache
  class { 'apache':
    default_vhost => false,
  }

  #start apache on port 80
  apache::vhost { 'b.example.com':
    port    => 80,
    docroot => '/var/www/b.example.com',
  }

  #add dynamic  page as file
  file { '/var/www/b.example.com/index.php':
    ensure => file,
    source => '/vagrant/index.php',
  } 

}
