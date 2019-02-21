# == Class: tick_stack::telegraf
#
class tick_stack::telegraf(
  String $influxdb_url,
  String $influxdb_database,
  String $influxdb_precision,
  ){
  contain tick_stack::telegraf::install
  contain tick_stack::telegraf::config

  class {'tick_stack::telegraf::install':
    require => Class['tick_stack::repo']
  } -> Class['tick_stack::telegraf::config']
}
