# == Class: tick_stack::telegraf::service
#
class tick_stack::telegraf::service {
  service { 'telegraf':
    ensure  => running,
    enable  => true,
    restart => true,
  }
}
