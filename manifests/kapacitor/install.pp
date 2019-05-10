# == Class: tick_stack::kapacitor::install
#
class tick_stack::kapacitor::install {
  assert_private()

  $ensure = $tick_stack::kapacitor::ensure

  package { 'kapacitor':
    ensure => $ensure,
  }
}
