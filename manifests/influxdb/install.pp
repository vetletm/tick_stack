# == Class: tick_stack::influxdb::install
#
class tick_stack::influxdb::install {
  assert_private()

  $ensure = $tick_stack::influxdb::ensure

  package { 'influxdb':
    ensure => $ensure,
  }
}
