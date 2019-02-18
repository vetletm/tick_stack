# == Class: tick
#
class tick_stack {
  include tick_stack::telegraf::install
  -> include tick_stack::telegraf::config
}
