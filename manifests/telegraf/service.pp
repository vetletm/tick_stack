# == Class: tick_stack::telegraf::service
#
class tick_stack::telegraf::service (
  $service    = $tick_stack::telegraf::params::service,
  $enable     = $tick_stack::telegraf::params::enable,
  $hasrestart = $tick_stack::telegraf::params::hasrestart,
  $hasstatus  = $tick_stack::telegraf::params::hasstatus,
  ) inherits tick_stack::telegraf::params {
  service { 'telegraf':
    ensure     => $service,
    enable     => $enable,
    hasrestart => $hasrestart,
    hasstatus  => $hasstatus,
  }
}
