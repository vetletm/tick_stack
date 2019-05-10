# == Class: tick_stack::chronograf::install
#
class tick_stack::chronograf::install {
  assert_private()

  $ensure = $tick_stack::chronograf::ensure

  package { 'chronograf':
    ensure => $ensure,
  }
}
