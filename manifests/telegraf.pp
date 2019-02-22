# == Class: tick_stack::telegraf
#
class tick_stack::telegraf(
  String $influxdb_url,
  String $influxdb_database,
  String $influxdb_precision,
  String $influxdb_username,
  String $influxdb_password,
  ){
  include tick_stack::repo

  class {'tick_stack::telegraf::install':
    require => Class['tick_stack::repo']
  }
  -> class {'tick_stack::telegraf::config':
  }
  ~> class {'tick_stack::telegraf::service':
  }
}
