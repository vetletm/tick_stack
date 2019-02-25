# == Class: tick_stack::influxdb
#
class tick_stack::influxdb {
  include tick_stack::repo
  class {'tick_stack::influxdb::install':
    require => Class['tick_stack::repo']
  }
  -> class {'tick_stack::influxdb::config':
  }
  ~> class {'tick_stack::influxdb::service':
  }
}
