# == Class: tick_stack::chronograf::service
#
class tick_stack::chronograf::service {
  assert_private()

  $service    = $tick_stack::chronograf::service
  $enable     = $tick_stack::chronograf::enable
  $hasrestart = $tick_stack::chronograf::hasrestart
  $hasstatus  = $tick_stack::chronograf::hasstatus

  service { 'chronograf':
    ensure     => $service,
    enable     => $enable,
    hasrestart => $hasrestart,
    hasstatus  => $hasstatus,
  }
}
