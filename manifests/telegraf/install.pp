# == Class: tick_stack::telegraf::install
#
class tick_stack::telegraf::install (
  $ensure    = $tick_stack::telegraf::params::ensure,
  $conf_path = $tick_stack::telegraf::params::conf_path,
  ) inherits tick_stack::telegraf::params {

  package { 'telegraf':
    ensure => $ensure,
  }
  -> file { 'telegraf_conf':
    ensure => absent,
    path   => $conf_path,
  }
}
