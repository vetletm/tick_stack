# == Class: tick
#
class tick_stack (
  String $influxdb_url,
  String $influxdb_database,
  String $influxdb_precision,

  Bool $include_telegraf,
  Bool $include_influxdb,
  ){
  contain tick_stack::influxdb
  contain tick_stack::telegraf

  Class['tick_stack::base'] ->
  if $include_influxdb {
    include tick_stack::influxdb
  }
  if $include_telegraf {
    include tick_stack::telegraf
  }
}
