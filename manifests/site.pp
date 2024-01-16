node 'slave1.puppet' {

  package { 'screen' : 
    ensuure => 'installed'
  }
  
}
