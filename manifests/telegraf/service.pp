# == Class: tick_stack::telegraf::service
#
class tick_stack::telegraf::service (
  $service = $tick_stack::telegraf::params::service
  ) inherits tick_stack::telegraf::params {
  service { 'telegraf':
    ensure     => $service,
    enable     => true,
    hasrestart => true,
  }
}
