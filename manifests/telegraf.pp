# == Class: tick_stack::telegraf
#
class tick_stack::telegraf {
  contain tick_stack::telegraf::install
  contain tick_stack::telegraf::config

  Class['tick_stack::telegraf::install'] -> Class['tick_stack::telegraf::config']
}
