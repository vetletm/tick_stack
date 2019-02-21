# == Class: tick_stack::influxdb
#
class tick_stack::influxdb {
  contain tick_stack::influxdb::install
  contain tick_stack::influxdb::config
  
  Class['tick_stack::influxdb::install'] -> Class['tick_stack::influxdb::config']
}
