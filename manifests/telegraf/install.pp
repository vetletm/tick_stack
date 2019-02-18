class install {
  # Get and configure Telegraf
  package { 'telegraf':
    ensure  => latest,
    notify  => Service['telegraf'],
  }

  service { 'telegraf':
   ensure  => running,
   enable  => true,
   require => Package['telegraf'],
   notify  => File['telegraf_conf'],
  }

  file { 'telegraf_conf':
    ensure  => absent,
    require => Service['telegraf'],
    path    => '/etc/telegraf/telegraf.conf'
  }
}
