# == Class: tick_stack::influxdb
#
class tick_stack::influxdb {
  class { 'tick_stack::influxdb::install':
    before => Class['tick_stack::influxdb::config']
  }
  class { 'tick_stack::influxdb::config':
  }
}
