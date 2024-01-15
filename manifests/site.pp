node default {
    class { '::apt':
        update_cache => true,
        allow_unauthenticated => on,
    }

    include apache
}
class apache {
    package { ['apache2']:
        ensure => present,
    }
}
