# == Class: tick_stack::kapacitor::service
#
class tick_stack::kapacitor::service {
  assert_private()

  $service    = $tick_stack::kapacitor::service
  $enable     = $tick_stack::kapacitor::enable
  $hasrestart = $tick_stack::kapacitor::hasrestart
  $hasstatus  = $tick_stack::kapacitor::hasstatus

  service { 'kapacitor':
    ensure     => $service,
    enable     => $enable,
    hasrestart => $hasrestart,
    hasstatus  => $hasstatus,
  }
}
