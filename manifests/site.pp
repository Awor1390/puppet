node 'master.puppet' {
    
  class{"nginx":
    manage_repo => true,
    package_source => 'nginx-mainline'
  }

  nginx::resource::upstream { 'upstream_app1':
    members => [
      '192.168.56.41:80',
    ],
  }

  nginx::resource::upstream { 'upstream_app2':
    members => [
      '192.168.56.42:80',
    ],
  }

  nginx::resource::location{'/static':
    proxy => 'http://upstream_app1' ,
    server => 'www.myhost.com',
  }

  nginx::resource::location{'/dynamic':
    proxy => 'http://upstream_app2' ,
    server => 'www.myhost.com',
  }
}


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

  class { '::apache::mod::php':
    php_version => '7',
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
