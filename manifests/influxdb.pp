# == Class: tick_stack::influxdb
#
class tick_stack::influxdb {
  contain tick_stack::influxdb::install
  contain tick_stack::influxdb::config

  class {'tick_stack::influxdb::install':
    require => Class['tick_stack::repo']
  } -> Class['tick_stack::influxdb::config']
}
