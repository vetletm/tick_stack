# == Class: tick
#
class tick_stack (
  String $influxdb_url,
  String $influxdb_database,
  String $influxdb_precision,
  String $include_telegraf,
  String $include_influxdb,

  ){
  contain tick_stack::base
  contain tick_stack::influxdb
  contain tick_stack::telegraf

  include tick_stack::base

  if $include_influxdb == 'True' {
    class {'tick_stack::influxdb':
      require => Class['tick_stack::base']
    }
  }
  if $include_telegraf == 'True' {
    class {'tick_stack::telegraf':
      require => Class['tick_stack::base']
    }
  }
}
