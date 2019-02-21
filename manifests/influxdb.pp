# == Class: tick_stack::influxdb
#
class tick_stack::influxdb {
  class {'tick_stack::influxdb::install':
    require => Class['tick_stack::repo']
  } -> Class['tick_stack::influxdb::config']
}
