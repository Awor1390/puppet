node default{
    file { 'file1':
      path => '/root/README.md',
      ensure => absent,
    }
  }
