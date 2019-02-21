# == Class: tick_stack::telegraf
#
class tick_stack::telegraf {
  Class['tick_stack::telegraf::install'] -> Class['tick_stack::telegraf::config']
}
