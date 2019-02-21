# == Class: tick
#
class tick_stack (
  String $influxdb_url,
  String $influxdb_database,
  String $influxdb_precision,
  String $include_telegraf,
  String $include_influxdb,

  ){
  contain tick_stack::influxdb
  contain tick_stack::telegraf

  Class['tick_stack::base'] ->
  if $include_influxdb == 'True' {
    include tick_stack::influxdb
  }
  if $include_telegraf == 'True' {
    include tick_stack::telegraf
  }
}
