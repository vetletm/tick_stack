# == Class: tick_stack::influxdb::install
#
class tick_stack::influxdb::install {
  package { 'influxdb':
    ensure => latest,
    notify => Service['influxdb'],
  }

  service { 'influxdb':
   ensure  => running,
   enable  => true,
   require => Package['influxdb'],
  }
}
