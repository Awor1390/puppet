include '::php'

node 'slave1.puppet' {

  #stop firewall
  exec { 'stop firewalld':
    command => 'systemctl stop firewalld',
    refresh => true,
  }

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
  file { '/var/www/html/index.html':
    ensure => file,
    content => "<html>\n
      <head>\n
        <title>Static page</title>\n
      </head>\n
      <body>\n
        <h1>Hello world</h1>\n
      </body>\n
    </html>\n",
  }  
}

node 'slave2.puppet' {

  #stop firewall
  exec { 'stop firewalld':
    command => 'systemctl stop firewalld',
    refresh => true,
  }

  #add php support
  class { '::apache::mod':
    'actions' => [
      { 'name' => 'php', 'enable' => true },
    ],
  }

  #init apache
  class { 'apache':
    default_vhost => false,
  }

  #start apache on port 80
  apache::vhost { 'b.example.com':
    port    => 80,
    docroot => '/var/www/b.example.com',
    mods_enabled => {
      'php' => true,
    },
  }

}
