# == Class: tick_stack::kapacitor::install
#
class tick_stack::kapacitor::install (
  $ensure    = $tick_stack::kapacitor::params::ensure,
  ) inherits tick_stack::kapacitor::params {

  package { 'kapacitor':
    ensure => $ensure,
  }
}
