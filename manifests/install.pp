# == Class: tick_stack::telegraf::install
#
class tick_stack::install (
  $ensure    = undef,
  $component = undef,
  ) {

  assert_private()

  package { $component:
    ensure => $ensure,
  }
}
