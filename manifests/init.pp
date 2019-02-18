# == Class: tick
#
class tick_stack {
  class { 'tick_stack::telegraf::install':
    notify => Class['tick_stack::telegraf::config'],
  }
  class { 'tick_stack::telegraf::config':
    require => Class['tick_stack::telegraf::install'],
  }
}
