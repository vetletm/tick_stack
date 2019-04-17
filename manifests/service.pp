# == Class: tick_stack::telegraf::service
#
class tick_stack::service (
  $service    = undef,
  $enable     = undef,
  $hasrestart = undef,
  $hasstatus  = undef,
  $component  = undef,
  ) {

  assert_private()

  service { $component:
    ensure     => $service,
    enable     => $enable,
    hasrestart => $hasrestart,
    hasstatus  => $hasstatus,
  }
}
