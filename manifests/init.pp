# == Class: tick
#
class tick_stack {
  include tick_stack::repo
  include tick_stack::telegraf
  include tick_stack::influxdb
}
