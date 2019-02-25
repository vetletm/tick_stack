# == Class: tick_stack::influxdb::install
#
class tick_stack::influxdb::install (
  $ensure = $tick_stack::influxdb::params::ensure
  ) inherits tick_stack::influxdb::params {
  package { 'influxdb':
    ensure => $ensure,
  }
}
