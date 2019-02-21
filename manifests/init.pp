# == Class: tick
#
class tick_stack (
  String $influxdb_url,
  String $influxdb_database,
  String $influxdb_precision,

  ){
  contain tick_stack::base
  contain tick_stack::influxdb
  contain tick_stack::telegraf

  Class['tick_stack::base']
  -> Class['tick_stack::influxdb']
  -> Class['tick_stack::telegraf']
}
