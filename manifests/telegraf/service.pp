# == Class: tick_stack::telegraf::service
#
class tick_stack::telegraf::service {
  assert_private()
  
  $service    = $tick_stack::telegraf::service
  $enable     = $tick_stack::telegraf::enable
  $hasrestart = $tick_stack::telegraf::hasrestart
  $hasstatus  = $tick_stack::telegraf::hasstatus

  service { 'telegraf':
    ensure     => $service,
    enable     => $enable,
    hasrestart => $hasrestart,
    hasstatus  => $hasstatus,
  }
}
