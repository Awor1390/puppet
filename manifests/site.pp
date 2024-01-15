node 'slave1.puppet' {
    # Declare a require for the Apache module
    require => Class['apache'],

    # Set up the Apache server
    class { 'apache': }

    file { '/var/www/html/index.html':
        ensure  => file,
        content => 'Hello, World!',
    }
}
