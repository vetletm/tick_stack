# == Class: tick
#
class tick_stack {
  class { 'tick_stack::base':
    before => Class['tick_stack::telegraf::install']
  }

  class { 'tick_stack::telegraf::install':
    before => Class['tick_stack::telegraf::config']
  }

  class { 'tick_stack::telegraf::config':
  }

  include tick_stack::influxdb
}
