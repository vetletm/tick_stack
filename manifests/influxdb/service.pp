# == Class: tick_stack::influxdb::service
#
class tick_stack::influxdb::service {
  service { 'influxdb':
    ensure  => running,
    enable  => true,
    restart => true,
  }
}
