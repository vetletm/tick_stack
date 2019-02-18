class tick_stack::telegraf::install (
  $operatingsystem  = downcase($::facts['os']['name']),
  $oscodename       = downcase($::facts['os']['distro']['codename'])
  ){
  apt::source { 'influx':
    location => "https://repos.influxdata.com/${operatingsystem}",
    repos    => 'stable',
    release  => $oscodename,
    key      => {
      'id'     => '05CE15085FC09D18E99EFB22684A14CF2582E0C5',
      'source' => 'https://repos.influxdata.com/influxdb.key',
    },
    before => Package['telegraf'],
  }

  package { 'telegraf':
    ensure  => latest,
    require => Apt::Source['influx'],
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
