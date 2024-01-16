node 'slave1.puppet' {
  
class { 'apache':
  default_vhost => false,
}

}
