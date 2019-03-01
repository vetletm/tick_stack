# == Class: tick_stack::influxdb::service
#
class tick_stack::influxdb::service (
  $service    = $tick_stack::influxdb::params::service,
  $enable     = $tick_stack::influxdb::params::enable,
  $hasrestart = $tick_stack::influxdb::params::hasrestart,
  $hasstatus  = $tick_stack::influxdb::params::hasstatus,
  ) inherits tick_stack::influxdb::params {
  service { 'influxdb':
    ensure     => $service,
    enable     => $enable,
    hasrestart => $hasrestart,
    hasstatus  => $hasstatus,
  }
}
