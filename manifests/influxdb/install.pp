# == Class: tick_stack::influxdb::install
#
class tick_stack::influxdb::install {
  package { 'influxdb':
    ensure => latest,
  }
}
