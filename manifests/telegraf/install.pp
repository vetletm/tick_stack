class tick_stack::telegraf::install {

  package { 'telegraf':
    ensure => latest,
    notify => Service['telegraf'],
  }

  service { 'telegraf':
   ensure  => running,
   enable  => true,
   require => Package['telegraf'],
   notify  => File['telegraf_conf'],
  }

  # After installation, telegraf will add a fully commented config file, this removes it so we can add our own
  file { 'telegraf_conf':
    ensure  => absent,
    require => Service['telegraf'],
    path    => '/etc/telegraf/telegraf.conf'
  }
}
