# == Class: tick_stack::influxdb::service
#
class tick_stack::influxdb::service {
  assert_private()
  
  $service    = $tick_stack::influxdb::service
  $enable     = $tick_stack::influxdb::enable
  $hasrestart = $tick_stack::influxdb::hasrestart
  $hasstatus  = $tick_stack::influxdb::hasstatus

  service { 'influxdb':
    ensure     => $service,
    enable     => $enable,
    hasrestart => $hasrestart,
    hasstatus  => $hasstatus,
  }
}
