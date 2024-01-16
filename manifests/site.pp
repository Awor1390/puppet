node 'slave1.puppet' {

  package { 'screen' : 
    ensure => 'installed'
  }
  
}
