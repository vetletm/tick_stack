# == Class: tick_stack::telegraf::install
#
class tick_stack::telegraf::install (
  $ensure    = $tick_stack::telegraf::params::ensure,
  ) inherits tick_stack::telegraf::params {

  package { 'telegraf':
    ensure => $ensure,
  }
}
