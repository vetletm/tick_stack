# == Class: tick_stack::influxdb::service
#
class tick_stack::influxdb::service (
  $service = $tick_stack::influxdb::params::service,
  ) inherits tick_stack::influxdb::params {
  service { 'influxdb':
    ensure  => $service,
    enable  => true,
    restart => true,
  }
}
