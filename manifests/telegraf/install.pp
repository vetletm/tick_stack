# == Class: tick_stack::telegraf::install
#
class tick_stack::telegraf::install {
  assert_private()

  $ensure = $tick_stack::telegraf::ensure

  package { 'telegraf':
    ensure => $ensure,
  }
}
