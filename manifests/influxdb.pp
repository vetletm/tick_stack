# == Class: tick_stack::influxdb
#
class tick_stack::influxdb {
  Class['tick_stack::influxdb::install'] -> Class['tick_stack::influxdb::config']
}
